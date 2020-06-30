from PIL import Image
from sklearn.externals import joblib
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import seaborn as sns
import shap
import streamlit as st
import time

st.title('Machine Learning Model Deployment')

st.markdown('<style>' + open('bg.css').read() + '</style>', unsafe_allow_html=True)
st.markdown('''
            <div class="waveWrapper waveAnimation">
  <div class="waveWrapperInner bgTop">
    <div class="wave waveTop" style="background-image: url('http://front-end-noobs.com/jecko/img/wave-top.png')"></div>
  </div>
  <div class="waveWrapperInner bgMiddle">
    <div class="wave waveMiddle" style="background-image: url('http://front-end-noobs.com/jecko/img/wave-mid.png')"></div>
  </div>
  <div class="waveWrapperInner bgBottom">
    <div class="wave waveBottom" style="background-image: url('http://front-end-noobs.com/jecko/img/wave-bot.png')"></div>
  </div>
</div>
            ''', unsafe_allow_html=True)

st.sidebar.title('ML Deploy :smile:')

@st.cache
def loaders():
    pipeline = joblib.load('model_v004.pkl')
    explainer = joblib.load('explainer_v002.pkl')

    return pipeline, explainer

pipeline, explainer = loaders()

def streamlit_features():
    st.header('Streamlit features')

    st.subheader("Demonstrate code.")

    st.code("""
pipeline = Pipeline(steps=[('preprocessing', StandardScaler()),
                           ('model', LogisticRegression())
                        ])
    """, language='python')

    st.subheader('View networks and demonstrate fluxes.')
    st.graphviz_chart('''
        digraph {
        { rank = same; Preprocessing Dataprep Model Evaluation Deploy }
            Preprocessing:nw -> Model:ne
            Preprocessing -> Dataprep
            Dataprep -> Model
            Model:sw -> Preprocessing 
            Model -> Evaluation
            Evaluation -> Deploy
        }
    ''')

    # Add a placeholder
    st.subheader('Use buttons to perform actions: ')
    if st.checkbox('View code:', key=0):
        st.code("""
if st.button('Click here:'):
    latest_iteration = st.empty()
    bar = st.progress(0)

    for i in range(100):
      # Update the progress bar with each iteration.
      bar.progress(i + 1)
      time.sleep(0.005)
              """, language='python')

    if st.button('Click here:', key=1):
        latest_iteration = st.empty()
        bar = st.progress(0)

        for i in range(100):
          # Update the progress bar with each iteration.
          bar.progress(i + 1)
          time.sleep(0.005)

    st.subheader('Users can input text')
    if st.checkbox('View code:', key=2):
        st.code("""
    st.text_input('Like this')
                """, language='python')
    st.text_input('Like this')


    st.subheader('Users can select several items at the same time')
    if st.checkbox('View code:', key=3):
        st.code("""
st.multiselect('Like this', ['a','b','c'])
        """, language='python')
    st.multiselect('Like this', ['a','b','c'])

    st.subheader('You can recapture users choices')
    if st.checkbox('View code:', key=4):
        st.code("""
choices = st.multiselect('Like this', ['a','b','c'])
        """, language='python')
    choices = st.multiselect('Like this', ['maçã','uva','banana'])
    st.write(f'You"ve chosen: {choices}')


def project_description():
    st.header('''
        MVP - Minimum Viable Product
        ''')
    st.subheader('Create a definition of success for your project.')
    if st.checkbox('Example', key=hash('example0')):
        st.write('- Offer users a way to check on their own loan risk probability.')
    
    st.subheader('''Describe what are your main objectives in terms of business.''')    
    if st.checkbox('Example', key=hash('example1')):
        st.write('- Use a machine learning model to predict risk.')
        st.write('- Provide users with a tool for them to check their own loan.')
        st.write('- Provide a model explainability platform for users to check why they were rejected.')
        st.write('- Create a documentation of the main technical and business decisions you"ve made.')

    st.subheader('''Document the steps involved.''')    
    
    st.write('- Show some data analysis.')
    st.write('- Document your coding strategy.')
    st.write("- Explain the model you've used.")
    st.write('- Use graphs to show your results.')

    st.subheader('''Deploy your model.''')    
    st.write('- Upload it to a website.')
        


def deploy():
    
    st.subheader('Credit risk prediction :money_with_wings:')
    train = pd.read_csv('data/loan_dataset_train.csv')

    st.sidebar.title("Loan :credit_card:")
    name = st.sidebar.text_input("Your name")

    amount = st.sidebar.text_input("How much do you want borrowed?? ")
    
    income = st.sidebar.text_input("How much do you earn for a living in a month?")

    loan_term = st.sidebar.selectbox("How many months are do you want??",
                                      [12, 36, 60, 84, 120, 180, 240, 300, 360, 480])

    st.sidebar.subheader('To check availability, we"ll need some information of yours.')
    gender = st.sidebar.selectbox("Are you a man or a woman?",
                                    ("Man","Woman"))
    married = st.sidebar.selectbox("Are you married?",
                                    ("Yes","No"))
    dependents = st.sidebar.selectbox("How many dependents do you have?",
                                    ("0","1", "2", "More than 2"))
    education = st.sidebar.selectbox("University status?",
                                    ("Graduated","Not Graduated"))
    self_employed = st.sidebar.selectbox("Do you have a formal job?",
                                    ("Yes","No, I'm self-employed"))

    serasa = st.sidebar.selectbox("Do you have your name on SERASA?",
                                    ("Yes", "No", "Don't know"))
    
    area = st.sidebar.selectbox("Which area the house belongs to?",
                                    ("Urban", "Rural", "Semiurban"))
    
    apply_button = st.sidebar.button('Generate my score')

    gender_map = {
        'Man': 'Male',
        'Woman': 'Female',
    }
    dependent_map = {'More than 2': '3+'}
    employ_map = {
        "Yes": 'No',
        "No, I'm self-employed": 'Yes',
        "Don't know": 'No'}
    serasa_map = {
        "Yes": 1,
        "No": 0,
        "Don't know": np.nan
        }

    if apply_button:
        # check errors:
        if (not amount) or (not income):
            st.write('You should input all values.')
            return

        client = pd.DataFrame({'Gender': [gender_map.get(gender, np.nan)],
                               'Married': [married],
                               'Dependents': [dependent_map.get(dependents, dependents)],
                               'Education' : [education],
                               'Self_Employed': [employ_map.get(self_employed, self_employed)],
                               'ApplicantIncome':[income],
                               'LoanAmount': [amount],
                               'Loan_Amount_Term':[loan_term],
                               'Property_Area': [area],
                               'Credit_History': [serasa_map.get(serasa, serasa)],
                               }, 
                               index=[name]
                               )
        st.write(client.T)

        incoming_cols = set(['Gender', 'Married', 'Dependents','Education','Self_Employed','ApplicantIncome', 
                             'LoanAmount', 'Loan_Amount_Term', 'Property_Area','Credit_History'])
        client_cols = set(client.columns)

        latest_iteration = st.empty()

        st.subheader("Here's what we predict you are at as compared to our database.")
        fig, ax = plt.subplots()
        sns.distplot(pipeline.predict_proba(train)[:, 1], hist=False, ax=ax)
        ax.vlines(pipeline.predict_proba(client)[:, 1], 0, 5, color='red', ls='--')
        ax.spines['top'].set_visible(False)
        ax.spines['right'].set_visible(False)
        st.pyplot()


        with st.spinner('Wait for it...'):
            bar = st.progress(0)

            for i in range(100):
                # Update the progress bar with each iteration.
                bar.progress(i + 1)
                time.sleep(0.01)

            probability = pipeline.predict_proba(client)[:, 1][0]

            st.write(probability)


        if probability < 0.7:
            st.balloons()
            image = Image.open('woohoo.jpg')
            st.subheader('HOORAY, you were approved! :weary:')
            st.image(image, use_column_width=True)
        else:
            image = Image.open('boo.jpg')
            st.header('Sorry, you were not approved. :weary:')
            st.image(image, use_column_width=True)

        # if he/she was rejected, let he/she understand the reason.
        
        st.header('Understand our decision.')
    
        shap_values = explainer.shap_values(pipeline.named_steps.dataprep.transform(client))

        shap.decision_plot(explainer.expected_value, 
                        shap_values, 
                        feature_names=joblib.load('display_columns.pkl'), 
                        show=False, link='logit')
        plt.savefig('decision_plot.png', bbox_inches='tight')
        image = Image.open('decision_plot.png')
        st.subheader('Your decision was mainly based due the following features.')
        st.image(image, use_column_width=True)

def doc():
    st.title('Documentation.')
    pass

goto = st.sidebar.radio('Go to:', ['Streamlit', 'Project Description', 'Model', 'Documentation'])

if goto == 'Streamlit':
    streamlit_features()

if goto == 'Project Description':
    project_description()

if goto == 'Model':
    deploy()

if goto == 'Documentation':
    doc()
