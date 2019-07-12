Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C88A166964
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jul 2019 10:54:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:To:Date:Message-ID:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Kck6hbhhqJFYaUZGwNg0IisIHaKuPKfDjJY/Dt9fWMs=; b=j0y//xtqivQgixuAKqhsew4pBL
	ldKHKKxok5J0S71vA/o/4/u3fvsvI4v1G5L3difSLtU1UjObpz3SgQRTa1CeHTt0vzYgzSBuntjL/
	yH7Mb/Aiih/evWV8XPIAVcxPrWDkvXN36pw7RQuSs0mjgUqmwNwC+aCpCa+jkGjrg0Ik=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hlrKL-0008EF-CL; Fri, 12 Jul 2019 08:54:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <kamil.adamec@e-devs.eu>) id 1hlrKJ-0008E7-UV
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 12 Jul 2019 08:54:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pZHH+xeZC+/weIDlTzQwGqTomOwDmW0lwtviQxz8Ftg=; b=Lv3+HM/BLTUZUEnf0C2vXS80+f
 +UK4NJdGme2Xaf4VTJXo9TyA7M4boGOb6J0TqmhqLDn1Dyoe6JBjSs4cTQBaTeXS5sy7PT2YVaB7o
 DnbkvP6vwVAPj8gSn7QKbjKMhPDBHfJ/PKCPxxDqBq1LJNQfqly+a7Q0Js+WwZKkLp98=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:To:From:Date:
 Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=pZHH+xeZC+/weIDlTzQwGqTomOwDmW0lwtviQxz8Ftg=; b=P
 Iv4Y7nd0iqpaMQoSu0njulSO0HxIZoRna/WeRJVHuwmU9ym9dFVMROaX+pq0UvcZWsP7LjZvEVa6B
 YLjNs2f5sAPfVY9f++vVDXoX7qXiXPr4TyArLpslWtU7vRQ3Q988cKZSW3MIz9IdH7TS8Ld3oDwrX
 XNaGAdJMPBnF6/bQ=;
Received: from [94.177.230.19] (helo=mail.e-devs.eu)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hlrKI-00Gqcb-OY
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 12 Jul 2019 08:54:47 +0000
Received: by mail.e-devs.eu (Postfix, from userid 1001)
 id 391E687A31; Fri, 12 Jul 2019 10:53:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=e-devs.eu; s=mail;
 t=1562921680; bh=pZHH+xeZC+/weIDlTzQwGqTomOwDmW0lwtviQxz8Ftg=;
 h=Date:From:To:Subject:From;
 b=tzw0q1qlKBPD4h7o7S7SB8O13lcVf7wwfVxWVl19EYZjq8gNXllAL0QJvMM8utMWX
 2kVQLqYCvy18eUWpD1rxYEkAq3zsNKkm0J+E0fCHcOJxCyLkLxntPxWS5UFLTssikE
 cGlWa/pfBU/u79jyUSFHDt2NMbCT6IndaekvEieE=
Received: by mail.e-devs.eu.e-devs.eu for
 <linux-f2fs-devel@lists.sourceforge.net>; Fri, 12 Jul 2019 08:53:18 GMT
Message-ID: <20190712105208-0.1.x.1l3l.0.jqwbklo01p@e-devs.eu>
Date: Fri, 12 Jul 2019 08:53:18 GMT
To: <linux-f2fs-devel@lists.sourceforge.net>
X-Mailer: mail.e-devs.eu
MIME-Version: 1.0
X-Spam-Score: 7.2 (+++++++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: e-devs.eu]
 2.5 URIBL_DBL_SPAM         Contains a spam URL listed in the Spamhaus DBL
 blocklist [URIs: e-devs.eu]
 3.6 RCVD_IN_SBL_CSS        RBL: Received via a relay in Spamhaus SBL-CSS
 [94.177.230.19 listed in zen.spamhaus.org]
 0.1 URIBL_CSS_A Contains URL's A record listed in the Spamhaus CSS
 blocklist [URIs: www.e-devs.eu]
 0.1 URIBL_CSS Contains an URL's NS IP listed in the Spamhaus CSS
 blocklist [URIs: www.e-devs.eu]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Headers-End: 1hlrKI-00Gqcb-OY
Subject: [f2fs-dev] =?utf-8?b?RG9kYXRlxI1uw6kgemRyb2pl?=
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
From: Kamil Adamec via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Kamil Adamec <kamil.adamec@e-devs.eu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RG9icsO9IGRlbiEKCsW9aXZub3N0bsOta8WvbSDEjWFzdG8gc3RvasOtIHYgY2VzdMSbIGsgZG9z
YcW+ZW7DrSDDunNwxJtjaHUgbsOtemvDoSDDunJvdmXFiCBwcm92b3puw61jaCB6ZHJvasWvIG5h
IG7DoWt1cCBtYXRlcmnDoWx1LCB6Ym/FvsOtIG5lYm8gc3Vyb3ZpbiB6IGTFr3ZvZHUgbmFwxZku
IG5lemFwbGFjZW7DrSBmYWt0dXIgKG5lemFwbGFjZW7DrSBvZCBkb2RhdmF0ZWzFrywgcHJvZGxv
dcW+ZW7DoSBzcGxhdG5vc3QgYXBvZC4pLiBWIHTDqXRvIG9ibGFzdGkganNtZSBqacW+IHBvbW9o
bGkgxZlhZMSbIGZpcmVtLCBrdGVyw6kgbW9obHkgZMOta3kgesOtc2vDoW7DrSBuw6F2cmF0bsOp
aG8gZmluYW5jb3bDoW7DrSByZWFsaXpvdmF0IHN2w6kga2zDrcSNb3bDqSBwbMOhbnkuCgpKc2Vt
IHBhcnRuZXJlbSBtbm9oYSBzcG9sZcSNbm9zdMOtLCBqZWppY2jFviDEjWlubm9zdCBqZSBzcm92
bmF0ZWxuw6EgcyB0b3UgVmHFocOtIGEgemEga29vcGVyYWNpIHMgbsOhbWkgesOtc2vDoXRlIGJv
bnVzIC0gcnljaGzDqSBzcGxhY2Vuw60gdmUgdsO9xaFpIGHFviA0IHNwbMOhdGVrLgoKRG92b2x0
ZSwgYWJ5Y2hvbSBWw6FzIGtvbnRha3RvdmFsaSB6YSDDusSNZWxlbSBwcm92ZWRlbsOtIGFuYWzD
vXp5IG1vxb5ub3N0w60gcG9tb2NpIGZpbmFuY292w6Fuw60uIEtkeSBieWNoIG1vaGwgemF2b2xh
dD8KCgpTIHBvemRyYXZlbQpLYW1pbCBBZGFtZWMKQWNjb3VudCBNYW5hZ2VyCnd3dy5lLWRldnMu
ZXUKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZv
cmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51
eC1mMmZzLWRldmVsCg==
