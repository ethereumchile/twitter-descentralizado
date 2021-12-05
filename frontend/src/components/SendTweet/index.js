import { useState } from 'react';

export default function SendTweet() {
    // acá la interacción con el smart contract de twitter
    const [tweet, setTweet] = useState('');
    const [error, setError] = useState('');

    const handlerChange = (e) => {
        setTweet(e.target.value);
    }

    return (
        <section id="contact">
            <div className="container">
                <div className="row">
                    <div className="col-md-offset-1 col-md-10 col-sm-12">
                        <div className="col-lg-offset-1 col-lg-10 section-title wow fadeInUp" data-wow-delay="0.4s">
                            <h1>Enviar tweet</h1>
                            <p>Totalmente descentralizado (y anónimo! 🥷)</p>
                        </div>

                        <div action="#" method="post" className="wow fadeInUp" data-wow-delay="0.8s">
                            <div className="col-md-12 col-sm-12">
                                <textarea name="message" rows="6" className="form-control" id="message" placeholder="Message"
                                    onChange={handlerChange}></textarea>
                            </div>
                            <div className="col-md-offset-3 col-md-6 col-sm-offset-3 col-sm-6">
                                <input type="submit" className="form-control" value="SEND MESSAGE" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    );

}