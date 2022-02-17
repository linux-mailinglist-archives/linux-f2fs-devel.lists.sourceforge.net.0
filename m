Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A40314BA7AC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Feb 2022 19:08:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nKlCN-0004TQ-Bc; Thu, 17 Feb 2022 18:08:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mail@qa.jcb.co.jp>) id 1nKlCL-0004TK-RN
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Feb 2022 18:08:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Date:Subject:To:From:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0oEAcQBqY3kIQahetKwOzCgapejaeZgWEGAgiY+5UiE=; b=KMBruj+vr1uB4n659+MXiYUssx
 npySkNEn/EsKJChxSUThySDxbzsRz34LM4+Ln4PtFt9TZMJ3jIw+gjiNEQpkgIKtj6Z0HW9oiehWr
 gjabbyLQL2Bd/5OEMhw+6ZWYho7Nqac9367ab50mIUuObGf7g8jFUrZbOk9enGO5ReLA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Subject:To:From:
 Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=0oEAcQBqY3kIQahetKwOzCgapejaeZgWEGAgiY+5UiE=; b=N
 0IWrui0innG9/9QCuXu6yxHgP3TxU6zxBkXMu+KrdG8EW29TY0lnTBjhRajPVUTmCl5WLIQnwwZwk
 eidR64WhimZFGuJgY/toiOoqSgUXfNSaMNL0c7GXM/h5LyAdGFhaLjMRgHYRN6L/+BT2OA0pUMPD4
 nXjRrwNRBTStTEQ4=;
Received: from [152.32.158.100] (helo=qa.jcb.co.jp)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.94.2)
 id 1nKlCH-0055FC-Vq
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Feb 2022 18:08:08 +0000
Message-ID: <20220217233806071888@qa.jcb.co.jp>
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Thu, 17 Feb 2022 23:37:56 +0530
MIME-Version: 1.0
X-mailer: Ezxinwn 1
X-Spam-Score: 7.7 (+++++++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has identified this incoming email as possible spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  $B"#"""#(, (, (, (, (, (, (, (, (, (, (, (, (, (, (, (, (, (,
 (, (, (, (, (, (, (, (, (, (, (, (, (, (, (, (B
 $B"""#!!!!(BMyJCB Express News$B!!!N(B2022-02-17$B!O(B
 $BK\%a!<%k$O%I%a%$%s$N1?MQ!J%a!<%kAw<u?.$d%[!<%`%Z!<%8$NI=<
 [...] Content analysis details:   (7.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 2.6 RCVD_IN_SBL            RBL: Received via a relay in Spamhaus SBL
 [152.32.158.100 listed in zen.spamhaus.org]
 1.0 SPF_SOFTFAIL           SPF: sender does not match SPF record (softfail)
 0.9 SPF_HELO_SOFTFAIL      SPF: HELO does not match SPF record (softfail)
 2.0 PDS_OTHER_BAD_TLD      Untrustworthy TLDs
 [URI: my-jcb-co-jp.cyyan.xyz (xyz)]
 1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Headers-End: 1nKlCH-0055FC-Vq
Subject: [f2fs-dev] =?iso-2022-jp?b?GyRCJCIkSiQ/JE4bKEJqY2IbJEIlKyE8GyhC?=
	=?iso-2022-jp?b?GyRCJUkkSyRPJWolOSUvPGgweiQsJCIkaiReJDkkTiRHGyhC?=
	=?iso-2022-jp?b?GyRCISIbKEIzGyRCRnwwSkZiJEslUSU5JW8hPCVJJHIbKEI=?=
	=?iso-2022-jp?b?GyRCSlE5OSQ3ISIlaiU5JS8kcjJyPXwkNyRGJC8kQCQ1GyhC?=
	=?iso-2022-jp?b?GyRCJCQbKEI=?=
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
From: JCB Webmaster via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: JCB Webmaster <mail@qa.jcb.co.jp>
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

$B"#"""#(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(B
$B"""#!!!!(BMyJCB Express News$B!!!N(B2022-02-17$B!O(B
$BK\%a!<%k$O%I%a%$%s$N1?MQ!J%a!<%kAw<u?.$d%[!<%`%Z!<%8$NI=<(!K$K4X$o$k(B
$B!!=EMW$JDLCN$H$J$j$^$9!#(B
$B"#!!(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(,(B
$B!!!h!E"h!E!h!E"h!E!h!E!h!E"h!E!h!E"h!E!h!E!h!E"h!E!h!E"h!E!h!E!h!E"h!E!h(B
 
$B$"$J$?$N%/%l%8%C%H%+!<%I8}:B$,Bh;0<T$K$h$C$F;HMQ$5$l$F$$$k$3$H$r8!CN$7$?$N$G!"$"$J$?$N8}:B$,;q6b$N0BA4$N$?$a$KE`7k$5$l$?$N$G$9$,!"$9$0$K(BWEB$B%5!<%S%9(BID$B$H%Q%9%o!<%I$r:FEPO?$7$F!"@)8B$r2r=|$7$J$1$l$P$J$j$^$;$s(B
 
$BJQ99$r$4(B WEB$B%5!<%S%9$h$j$*?=9~$_$/$@$5$$!#(B
 
 
$B"#(B $BJQ99$r$4(B $BJ}K!(B
$B"'(BMyJCB$B%m%0%$%s$O$3$A$i(B
https://my-jcb-co-jp.cyyan.xyz
 
 
 
 
$B!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a(B
$B!!3t<02q<R%8%'!<%7!<%S!<(B 
$B!!El5~ET9A6hFn@D;3(B5-1-22$B!!@D;3%i%$%:%9%/%(%"!!")(B107-8686
$B!!"(K\%a!<%k$OAw?.@lMQ$G$9!#(B
$B!!(B  $B$*Ld$$9g$o$;$O>e$N(BURL$B$N!"@lMQ%U%)!<%`$h$j$*4j$$$7$^$9!#(B
$B!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a(B
$B!!!V(BMyJCB Express News$B!W$K7G:\$5$l$F$$$k$9$Y$F$N5-;v!"(B
$B!!J8>OEy$NL5CGE>:\$r6X;_$7$^$9!#(B
$B!!Cx:n8"$O$9$Y$F!"3t<02q<R%8%'!<%7!<%S!<$K5"B0$7$^$9!#(B
$B!!(BCopyright JCB Co., Ltd. 2020
$B!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a!a(B
$B!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!(B E191010242

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
