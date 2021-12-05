export default function Tweets(props) {
    const { tweets } = props;
    return (
        <section id="about">
            <div className="container">
                <div className="row">
                    {tweets.map(({ nickname, content, likeCounter, address }, key) => (
                        <div className="col-md-12 col-sm-8 wow fadeInUp" data-wow-delay="0.2s" key={key}>
                            <div className="about-thumb">
                                <h1>{nickname} (@{address})</h1>
                                <p>{content}</p>
                                <p>{likeCounter} me gusta</p>
                            </div>
                        </div>)
                    )}
                </div>
            </div>
        </section>
    )
}