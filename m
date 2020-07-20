Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 082EB225F01
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Jul 2020 14:49:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jxVEe-000200-U2; Mon, 20 Jul 2020 12:49:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <Markus.Elfring@web.de>) id 1jxVEd-0001zt-L3
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jul 2020 12:49:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AHmNfJS+mHBQaE2Wm+D3CXhES2+POrXjo7/PczLeBu8=; b=D7YxIQW2M51v3jUYj9Wam+tBRA
 rVAZ75+a4yVKNj1v6koFwfMoKu4Odoh5I1ZPJKIPg60KIvcM/eHtQhbRltZnrg04QvSK/Njfnf8OH
 ZdwANTUggHBRuwA6TgZNGuRaWp6yyt4nM5jFN0bx6UM/RfSNuyKGpCcsSOYF+LMpB5sY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AHmNfJS+mHBQaE2Wm+D3CXhES2+POrXjo7/PczLeBu8=; b=lV2WYnvaYEP60pX8nuYQRq0ufl
 WmqvtKrDvd9YKtjcK++dUQGt1721FKc3Gv0SGRGXDQXPThynWSdhS9wXqnGAMwqjkNFm76eK3FBgM
 Moc7TtVQC2Ox3lg3hukifxf2/HvQQ/dLYyDb/3KWjPHsj7HMu9D5ucz4BKiup6F8t0ig=;
Received: from mout.web.de ([212.227.15.14])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jxVEb-001VKg-SA
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jul 2020 12:49:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1595249363;
 bh=AHmNfJS+mHBQaE2Wm+D3CXhES2+POrXjo7/PczLeBu8=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=ItIoDYI1AOqnuKrU1Ut2b+ED1favjQMPZD87RGTt5NV2gDJTwSmGNNqQ48A/QOeRw
 uNmD0jI+b5Vl4RKvZGzKMGl9z/8FrHmQE/6hrAiKfr2IVPSfDE6KsTgjuNzE77gmBI
 ZNX0BQYmG2nL26BsgumYqvZdgT4a+gnaUgkbHlXc=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.85.87]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Lvk9E-1ktl9z2cd2-017RtL; Mon, 20
 Jul 2020 14:49:23 +0200
To: Chao Yu <yuchao0@huawei.com>, linux-f2fs-devel@lists.sourceforge.net
References: <6074306e-e909-e17f-900c-320245a8f869@web.de>
 <8be91065-7c85-9501-f1c2-3cf11aab85a5@huawei.com>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <cd74c280-80e2-910b-0770-72e19d68573f@web.de>
Date: Mon, 20 Jul 2020 14:49:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8be91065-7c85-9501-f1c2-3cf11aab85a5@huawei.com>
Content-Language: en-GB
X-Provags-ID: V03:K1:QXnBLnkvHco5KeL1z1qol69sM9TrLUJZ3+uRoBBIec9C3CBVXtQ
 STrO0geYL1PQ7kCYzJpqeErGP8IteuoJaEJatSHXToa1335jMR3+Y9O24DymQtjO0VJDcNV
 e8hvS/XVbjINNxlCp/CXvNKJoOIcvDi8Hpvsq8OPpNmlMZm4buGjwKQHiwzAjPMNso07b6x
 9YS6BodWfcxUxkS3U8NSA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:l2I0rgVWuMk=:4rJhMW2iLqpY9lKVUGpRlQ
 oazIc5Wji9ZkMv2HyRXA9pYjPNdnkb8E6m3uvmutojrFThYbnDoveeak4lslCYKhYa8kJPMbD
 eBc23DNrDE87F9zVdvfFd/kW4QqLBCmzTfSKua/u8uSwWhNDClM+0ZF4w6XTE68UdLzCVtRKi
 tCEszf4Yp9Rf96WB7Dm5kmz44vhrNFpPjdWHsQPN6iESnYqVrl4WJ5KXuy+5SXyRAbW5tivAY
 zt6CC7TAOq5j0vHIM3QF2z8wzZPGcMgYFADpODpv5Z4wq7lzMLFSU+ArBJnf06DMADOapm+AI
 KKXNyJTu+bFxyID3B8yV8rV+9KJ+JSS7+JDBq26KaIye+GC8SUUbcLkXL18s4O7fB+DjJPkd8
 QswOwNSm3mXctKd0iIbA3Z9YpDAk/hZ0cWpo/h/+sxzfF/PsdOxRnPhNXF2Q60V3Qquv8EJYI
 tBdhlCMfPb7NJWkpsDadY1/0CG9Z+r+1I9VoVxvVbG5rpzDk52nAzG+Sk3TzjbviNLBxNaCdq
 odlWt07ukCXnp2/6C18Pl+jRfO/UpkLs3PKbqWU80GuhtjmMihZLEFFz37sCXs38l7KvwUYPo
 jtIp513IWcsUgdT8DTegF7s91pbMk9K1pLWUsd7if8mKf1yYvXxkcpzwM77muFk5dEYFgICKt
 vBMO2eQomvuZxl4f1LoBeBNjlLYn3Tq/HPhgL/ucQun0U7+o2kHEJGzgBqxOY1O78ZvNlE6m9
 YJV0X6hPtiJTIer0ThUOxgI8RQVbVD03jBC5rtUgvDtJPKr125j8v475dGN5DXnGkGKbge7g3
 xVKkJ3/OGTVGFB4VxtjZlrCK0uIjgioz9DOOIU79TLMtCdZy1nYizcIZrdUqxxBTYlkLnkcr4
 lIjzZLkDD6E7LBZBaSkibF5ewiL8phlBzpPoK/NZp8rDP6gbw9X93tHBhJNrcBjpwoda45HnP
 zLxy+5AbMwC1F8h+9pS0cbMAp+7k9/BdrkIYCiCY5kr/Ie30v8rANVurWpt29jRZK8Rw6zIsD
 XgI3uesg6IGRVaRSKIwiDT+SAlr59KBLF2wpcCtUClv4DUXOPROKGeSkdLHgEa/OyfYvF0viR
 DLxDlBYmzU0gJB8sah0qdW90UuabxVi0oYPaMyQxPmkDDyA/nxGHC28lqL+xThgx+NxlzzYl1
 KpqbqJ17/nP+AMHePmYninavG2+CtIOMIPBxs6f02cRO+8oGQdTiB66qLlMlcpjbqbG34BqXJ
 Z7ydNM4RIRY/94+q/SzgZA0rIPuRmXIbCV6MC9w==
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (markus.elfring[at]web.de)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [212.227.15.14 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jxVEb-001VKg-SA
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: Avoid memory leak on
 cc->cpages
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Pj4+IE1lbW9yeSBhbGxvY2F0ZWQgZm9yIHN0b3JpbmcgY29tcHJlc3NlZCBwYWdlcycgcG9pdG5l
ciBzaG91bGQgYmUKPj4+IHJlbGVhc2VkIGFmdGVyIGYyZnNfd3JpdGVfY29tcHJlc3NlZF9wYWdl
cygpLCBvdGhlcndpc2UgaXQgd2lsbAo+Pj4gY2F1c2UgbWVtb3J5IGxlYWsgaXNzdWUuCj4+Cj4+
ICogV291bGQgYW4gaW1wZXJhdGl2ZSB3b3JkaW5nIGJlIG1vcmUgYXBwcm9wcmlhdGUgKHdpdGhv
dXQgYSB0eXBvKQo+PiDCoCBmb3IgdGhlIGNoYW5nZSBkZXNjcmlwdGlvbj8KPj4KPj4gKiBXaWxs
IHRoZSB0YWcg4oCcRml4ZXPigJ0gYmVjb21lIGhlbHBmdWwgZm9yIHRoZSBjb21taXQgbWVzc2Fn
ZT8KPgo+IEl0IGxvb2tzIHRoaXMgaXMgcmVwbGllZCBmcm9tIHBhdGNoLXJvYm90PyBzaW5jZSBJ
IGZvdW5kIGFsbCBjb21tZW50cwo+IHlvdSByZXBsaWVkIGFyZSBhbG1vc3QgdGhlIHNhbWUuCgpJ
IGRhcmUgdG8gcmVwZWF0IHN1Y2ggc3VnZ2VzdGlvbnMgYmVjYXVzZSBzZXZlcmFsIHBhdGNoZXMg
Y29udGFpbgppbXByb3ZhYmxlIGRldGFpbHMgKG5vdCBvbmx5IGluIHRoZSBhZmZlY3RlZCBzb3Vy
Y2UgY29kZSkuCgpSZWdhcmRzLApNYXJrdXMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
