import static com.ninja_squad.dbsetup.Operations.*;

public class CommonOperations {
    public static final Operation DELETE_ALL =
        deleteAllFrom("SECRRET_QUESTIONS","USERS","ARTICLES","TAGS","ARTICLE_TAG","COMMENTS","DIRECT_MESSAGES","CAUTIONS","COMMUNITIES","COMMUNITY_MEMBERS_LIST","TOPIC","CHAT","CONTACTS","RULES","POLICY","SIGN_UP_KEYS");
}
