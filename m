Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9064F8B8F0D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  1 May 2024 19:29:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s2Dlk-0006e1-TG;
	Wed, 01 May 2024 17:29:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <noreply@yutingle.com>) id 1s2Dlj-0006dn-Aq
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 01 May 2024 17:29:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Date:Subject:To:From:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=icq2+fCMCYBBrDTcLLcSTO9mRFab586sEGGiqx0ZKpI=; b=Avo/vgcuGd/EujxU4RXJb7jz3V
 dd7ioN9yh1/P1k+S1d0clG9lWd14C4/9ZIMKaTb+Wo/UmxD1saoP4+7HL2sx4ZCy+t4zRcdtFelXP
 M5hiw3PvFPAxy+uHZ315q2ef4DOpf2mPo2P8LS4exzPFb9bSDM2CWDOCiDBAnNqtEcIU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Subject:To:From:
 Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=icq2+fCMCYBBrDTcLLcSTO9mRFab586sEGGiqx0ZKpI=; b=C
 TUfJoD4FQ4M5ngU8FnubAyM0HjBmKICrNjsQZH6LWYmB8joj3/yrlKAxTRC40NO1CiXpxoGO87IRG
 O2W5jIDqw2CSCBFBy4jxS6MONLbNm+BNJH3pBfmS2nC9bfdoMwQ94g94LGpjmg4ncRrQLurq2L9L/
 d30gZTWYL7dPCKqw=;
Received: from [107.149.241.179] (helo=mail0.yutingle.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s2Dlh-0007om-OR for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 01 May 2024 17:29:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=default; d=yutingle.com;
 h=Message-ID:From:To:Subject:Date:MIME-Version:Content-Type:
 Content-Transfer-Encoding; i=noreply@yutingle.com;
 bh=icq2+fCMCYBBrDTcLLcSTO9mRFab586sEGGiqx0ZKpI=;
 b=AFO+gSF85veSLv1GVOcjvLl9XbfEugOsKaVpXodB5IFngeI0h4lQP75y0TN/5WxN/3P5qjP+09AP
 EW67sOZTYbpiPti+W/hPZguJrc2fFjhbfKRbQuoSjIjVi/L3CAD+tJHj0ghfSv7LJJBVvoVLMMpO
 W8OOwOqcPE2r3AJzies=
Message-ID: <0186721ccc634a645338059304a6776f@yutingle.com>
From: =?utf-8?B?6Ieq5YuV44Oh44O844Or6YCB5L+h?= <noreply@yutingle.com>
To: linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Date: Thu, 02 May 2024 01:08:57 +0800
MIME-Version: 1.0
X-Spam-Score: 2.4 (++)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  三 井 住 友 カ ー ドをご利用のお客様へ このたびは三
    井 住 友 カ ー ドをご利用いただき、誠にありがとうございます。
    下記のご利用照会がございましたので、お知らせいたします。
    
 
 Content analysis details:   (2.4 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 URIBL_PH_SURBL         Contains an URL listed in the PH SURBL blocklist
                             [URIs: espalteam.com]
  0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
                             blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [URIs: espalteam.com]
  1.3 RCVD_IN_VALIDITY_RPBL  RBL: Relay in Validity RPBL,
                             https://senderscore.org/blocklistlookup/
                           [107.149.241.179 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  1.3 RDNS_NONE              Delivered to internal network by a host with no rDNS
X-Headers-End: 1s2Dlh-0007om-OR
Subject: [f2fs-dev] =?utf-8?b?44CQ5LiJ5LqV5L2P5Y+LIOOCq+ODvOODieOAkSDjgYo=?=
	=?utf-8?b?5pSv5omV44GE5LqI5a6a6YeR6aGN44Gu44GU5qGI5YaF?=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

5LiJIOS6lSDkvY8g5Y+LIOOCqyDjg7wg44OJ44KS44GU5Yip55So44Gu44GK5a6i5qeY44G4DQoN
CuOBk+OBruOBn+OBs+OBr+S4iSDkupUg5L2PIOWPiyDjgqsg44O8IOODieOCkuOBlOWIqeeUqOOB
hOOBn+OBoOOBjeOAgeiqoOOBq+OBguOCiuOBjOOBqOOBhuOBlOOBluOBhOOBvuOBmeOAgg0K5LiL
6KiY44Gu44GU5Yip55So54Wn5Lya44GM44GU44GW44GE44G+44GX44Gf44Gu44Gn44CB44GK55+l
44KJ44Gb44GE44Gf44GX44G+44GZ44CCDQoNCuKAu+acrOODoeODvOODq+OBr+OAgeOBlOWIqeeU
qOODu+iri+axguOCkueiuuWumuOBmeOCi+OCguOBruOBp+OBr+OBguOCiuOBvuOBm+OCk+OAgg0K
44GU5Yip55So5pel5pmC77yaMjAyNCAvIDA1IC8gMDEgICAgICAyMyA6IDE4DQrjgZTliKnnlKjl
oLTmiYDvvJrjgrvjg5bjg7Mt44Kk44Os44OW44OzIOWNg+S7o+eUsOS4gOODhOapiyAxIOS4geeb
ruW6lw0K44GU5Yip55So6YeR6aGN77yaOSwgNTgw5YaGDQoNCuOCq+ODvOODieOCkuS9v+eUqOOB
l+OBn+immuOBiOOBjOOBquOBhOWgtOWQiOOBr+OAgeS7peS4iyDjga4g44OqIOODsyDjgq8g44KS
44Kv44OqIOODgyDjgq8g44GXIOOBpuOCqyDjg7wg44OJ5L2/55So44Gu6Kmz57Sw44KS56K66KqN
44GX44Gm44GP44Gg44GV44GE44CCDQpodHRwczovL2VzcGFsdGVhbS5jb20NCg0K77yc44GU5rOo
5oSP54K577yeDQrigLvvvJHvvI7mnKzjgrXjg7zjg5Pjgrnjga/jgIHjgYrlrqLmp5jjga7kuIkg
5LqVIOS9jyDlj4sg44KrIOODvCDjg4njga7jgZTliKnnlKjnhafkvJrjgYzooYzjgo/jgozjgZ/l
oLTlkIjjgIENCuS4iSDkupUg5L2PIOWPiyBORVTjgavjgZTnmbvpjLLjgYTjgZ/jgaDjgYTjgabj
gYTjgovjg6Hjg7zjg6vjgqLjg4njg6zjgrnjgbjjgYrnn6XjgonjgZvjgZnjgovjgrXjg7zjg5Pj
grnjgafjgZnjgIINCuKAu++8ku+8juOBlOWlkee0hOOCreODo+ODs+OCu+ODq+OBqOOBquOBo+OB
n+WgtOWQiOOBruOBiuWPlua2iOOBl+aDheWgseOBr+mFjeS/oeOBleOCjOOBvuOBm+OCk+OAgg0K
4oC777yT77yO5LiJIOS6lSDkvY8g5Y+LIFZpc2Hjg5fjg6rjg5rjgqTjg4njgqvjg7zjg4nlj4rj
gbPkuInkupXkvY/lj4vjg5Djg7zjg4Hjg6Pjg6vjgqsg44O8IOODieOBruOBlOWIqeeUqOWIhuOC
guWQq+OBv+OBvuOBmeOAgg0K4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU
4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCUDQrilqDnmbog6KGMIOiAheKWoA0K5LiJIOS6lSDk
vY8g5Y+LIOOCqyDjg7wg44OJ5qCq5byP5Lya56S+DQrjgJIxMzUtMDA2MQ0K5p2x5Lqs6YO95rGf
5p2x5Yy66LGK5rSyMuS4geebrjLnlaozMQoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
