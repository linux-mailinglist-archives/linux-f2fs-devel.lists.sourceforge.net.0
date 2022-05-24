Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2614E5326F3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 May 2022 11:57:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ntRID-0008NM-Fw; Tue, 24 May 2022 09:57:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <amjad.ali@box.indicandustries.com>)
 id 1ntRI1-0008LI-0R
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 May 2022 09:57:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:To:From:Reply-To:Sender:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fbokhu8LmIj3W/xVvsKXca9FyI6kL5nweWZNW3ZlSJA=; b=cVqtVX9yq0DyJjOJv8x26KWG9d
 iBVopoEru9hl3S5EUGmSE0rW/jcACLdg2m9j1FXFLz6XU4SZXF2xZCtdTT9UiGfFeB0x+Ty6LNrTh
 L2xX/J7h1TCxWHyzZvNS1jdkHuRRewXB13bKAQEMZCu4UnJfVck//9TKV8YWB3LDYWJ8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:To:From:Reply-To:Sender:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=fbokhu8LmIj3W/xVvsKXca9FyI6kL5nweWZNW3ZlSJA=; b=H
 JSYKomB5h89blpz/3LYAqw5hahW3aRHTk3JIq1vHGbIn1tb5WPiRXaHa0XODgiguuV66RTOO4SMnu
 zPhg5dMQLZuQ5STiJbTv2H9pP/iwHAbTtKeMTk9kHAZeZOnjBOWaL3cNaimlhK2CY+Ns6upKdlVLD
 hW4tGsofhElLT/6c=;
Received: from hwsrv-970840.hostwindsdns.com ([104.168.149.109]
 helo=box.indicandustries.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1ntRHt-0007wm-9J
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 May 2022 09:57:13 +0000
Received: from authenticated-user (box.indicandustries.com [104.168.149.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by box.indicandustries.com (Postfix) with ESMTPSA id 43F7F107B91
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 24 May 2022 03:23:40 -0600 (MDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=box.indicandustries.com; s=mail; t=1653384220;
 bh=V6VCn7WEbqHjVVQ20/+SYu6rwS1WmTHcxX88g+j430s=;
 h=Reply-To:From:To:Subject:Date:From;
 b=XBE3C66Dca8qPYN3Gq4ab9aj4lKBMNxkC65UKJVxZ2/hJQtStuFaM3ZUFu/pWVfeH
 YQfWJWctKyLZgsQ1MMCp4dmIgjK1BxmV4Nk6dRaMACszDcSmObdAD8pUzZkDAn3lw5
 mqv1VlypQPmQWKrqhwvOtN7WNtgoytTDwHk9YQ3CQ+AIoH7shjtngPC9mdW72ZzgxA
 ODTrdWrv6ssiGZQ2GUH3opi442aEhQGH21uPw7Zr7TPsm/TuW4MpDJbXqJghm4Xzc9
 WyU+AGLCZS+41wUF4+lTxeGqBpW7gVOs9GBgTMUOmNh8mlO6P7qKkwqHxh73NhzO2p
 9YcbWZuOCgzhA==
To: linux-f2fs-devel@lists.sourceforge.net
Date: 24 May 2022 11:23:39 +0200
Message-ID: <20220524112339.7EB5BF6A3F61B004@box.indicandustries.com>
MIME-Version: 1.0
X-Spam-Score: 2.6 (++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello, Greetings? I am Amjad. I work with a leading Bio Firm.
 Due to the setbacks of the pandemic, my company has opened a bid in search
 of new suppliers for basic raw materials needed in production. 
 Content analysis details:   (2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
 digit [amjalia90[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 2.5 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Headers-End: 1ntRHt-0007wm-9J
Subject: [f2fs-dev] Hello Sir, I seek your urgent consideration.
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
From: "amjad.ali--- via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: amjalia90@gmail.com
Cc: amjad.ali@box.indicandustries.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGVsbG8sCgpHcmVldGluZ3M/IEkgYW0gQW1qYWQuIEkgd29yayB3aXRoIGEgbGVhZGluZyBCaW8g
RmlybS4gIER1ZSB0byAKdGhlIHNldGJhY2tzIG9mIHRoZSBwYW5kZW1pYywgbXkgY29tcGFueSBo
YXMgb3BlbmVkIGEgYmlkIGluIApzZWFyY2ggb2YgbmV3IHN1cHBsaWVycyBmb3IgYmFzaWMgcmF3
IG1hdGVyaWFscyBuZWVkZWQgaW4gCnByb2R1Y3Rpb24uCgpJIGFtIHNlZWtpbmcgYSByZXByZXNl
bnRhdGl2ZcKgYXMgSSBhbSBhIHN0YWZmLCBJIGNhbiBub3QgYmUgCmludm9sdmVkIGRpcmVjdGx5
LiBJdCBtYXkgbm90IGJlIHlvdXIgYXJlYSBvZiB3b3JrIGJ1dCB0aGUgCnByb2ZpdHMgYXJlIGdy
ZWF0IGFuZCBJIHdpbGwgZ3VpZGUgeW91IHRocm91Z2guIEkgaGF2ZSBhbHJlYWR5IApzb3VyY2Vk
IGEgbG9jYWwgc3VwcGxpZXIgZm9yIHRoaXMuIEkgb25seSBuZWVkIGEgcmVsaWFibGUgCnJlcHJl
c2VudGF0aXZlLgoKUGxlYXNlIGdldCBiYWNrIHRvIG1lIHNvIEkgY2FuIGV4cGxhaW4gdGhpcyBp
biBmdWxsLgoKQW1qYWQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9s
aXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
