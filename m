Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6D874A52
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Jul 2019 11:49:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hqaNk-0002JT-Ks; Thu, 25 Jul 2019 09:49:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <baijiaju1990@gmail.com>) id 1hqaNj-0002JL-Rj
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 25 Jul 2019 09:49:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Date:Message-ID:Cc:To:Subject:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oZSwNDTQE6wHoAx64RntiWGx7Zw6F6VIIKSpa+cvjO0=; b=TKOU/omaTjfoUr335eTfmg9Vci
 jIwYCaJCks/5b1ggaaWIz/s3zIErpVM3dAXC0lbyNejELULQVBfMY8oLhAFUbNqljh74ttIp0W6BY
 GjtNAsYQ0tuyq5+mXVKUvNrhc0oLqgERQjsQcMkRzQZJvuAj9XAUwU2UXp5Gf111A11Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID:Cc:To
 :Subject:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=oZSwNDTQE6wHoAx64RntiWGx7Zw6F6VIIKSpa+cvjO0=; b=F
 mQ0aCYHk9X2zl4VeFudFlcnrEJDf2XFuBen8ReKynQWewI15kzt+Ss7eOp4YQrmf9ZkdeFou4sH14
 Ju89y4NFMND4dbF9ZHVkS82yflfy60D6yMp9efIknvhaEQPsaURabilrz69aShfkqCARogh6Rukh9
 FwsFXAoQjGKyjnCk=;
Received: from mail-pg1-f177.google.com ([209.85.215.177])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hqaNh-000Bqz-Vq
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 25 Jul 2019 09:49:51 +0000
Received: by mail-pg1-f177.google.com with SMTP id t132so22758519pgb.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 25 Jul 2019 02:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:cc:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=oZSwNDTQE6wHoAx64RntiWGx7Zw6F6VIIKSpa+cvjO0=;
 b=mjm595ixiYU7VCkkUMzNZckTFgvqQ34fOydYaMYAih1h0CCB+y7qZe2FPnEL+kfIzU
 ZslbsZ7YoFD72G2hwUBc5RGkiLQbe8Pw7APcZzjxE47CTrhF1HoN2dGPrZnuMCqEcfmh
 p45ehMUw3aNB5tAdBFQczsNpwpTKIBcaBu4BJ7oOKOBnItIxbLnJ+Ci1l/T86ATjPJIW
 2SdD6YN/oeYOj5QzhspJ14RGZ1k3an7xptG7Tw+nc8nD5WrskPe4cxAF4w+DNXA66Q1v
 ah4eQu1NBBd9vkDtzvPNFHDIdA03Tv/Kb23emvDtehG7BvtLdfKFAIr3JiRA1BxLFrxV
 MXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=oZSwNDTQE6wHoAx64RntiWGx7Zw6F6VIIKSpa+cvjO0=;
 b=KBFHoLZfNgux0jRvbnFXdvAoPw/bl1xz/on7jA3Nwmx3hejTPZi8GfnpwKM2zwLTbx
 Bm9z+S3HJk4Q7tuQHxhVT45gsOsILOL8lmt+S+IoiupUdOykueHwgfzaZeoI0cOjAupQ
 6BzLx86fijJvPZ89CglApr6jH2VMJpB9OjqWwatiLkA3TGRiyikja7boHSqaij32f0Uf
 sIH/b6Poe6+z0z/Ahvz2xYogzymyis3oyY0simED7kSfeGSTimmfwfP8MEQTecNgqNtm
 O7EFmXSn60ecHgx9RVffZcYBkMSoroYGpdiP6tc+6WHlFiLEQmLVq0XAjy5QmT7kIl9L
 n/og==
X-Gm-Message-State: APjAAAXGoSbPeJV5SePrn3xuPzo5+89LyV7pDOUIJjsPLLymHywfEjQW
 UJzlR/gTrXLkbfCfxNWWTJ0=
X-Google-Smtp-Source: APXvYqy4/rOfkfiy1cFV1h646JsiLRHGm3LS2zm8tqb+EzXwDn56CYgbp9RigZdx42cX4n2gc40Lng==
X-Received: by 2002:a17:90a:376f:: with SMTP id
 u102mr92762286pjb.5.1564048184358; 
 Thu, 25 Jul 2019 02:49:44 -0700 (PDT)
Received: from ?IPv6:2402:f000:4:72:808::177e? ([2402:f000:4:72:808::177e])
 by smtp.gmail.com with ESMTPSA id p13sm127488877pjb.30.2019.07.25.02.49.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jul 2019 02:49:43 -0700 (PDT)
From: Jia-Ju Bai <baijiaju1990@gmail.com>
To: jaegeuk@kernel.org, yuchao0@huawei.com
Message-ID: <f577be2f-fc2f-9ef8-2c6c-9c247123b1ad@gmail.com>
Date: Thu, 25 Jul 2019 17:49:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Language: en-US
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (baijiaju1990[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.177 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (baijiaju1990[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hqaNh-000Bqz-Vq
Subject: [f2fs-dev] [BUG] fs: f2fs: Possible null-pointer dereferences in
 update_general_status()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SW4gdXBkYXRlX2dlbmVyYWxfc3RhdHVzKCksIHRoZXJlIGFyZSB0d28gaWYgc3RhdGVtZW50cyB0
bwpjaGVjayB3aGV0aGVyIFNNX0koc2JpKSBpcyBOVUxMOgpMSU5FIDcwOsKgwqDCoMKgIGlmIChT
TV9JKHNiaSkgJiYgU01fSShzYmkpLT5mY2NfaW5mbykKTElORSA3ODrCoMKgwqDCoCBpZiAoU01f
SShzYmkpICYmIFNNX0koc2JpKS0+ZGNjX2luZm8pCgpXaGVuIFNNX0koc2JpKSBpcyBOVUxMLCBp
dCBpcyB1c2VkIGF0IHNvbWUgcGxhY2VzLCBzdWNoIGFzOgpMSU5FIDg4OiByZXNlcnZlZF9zZWdt
ZW50cyhzYmkpCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBTTV9J
KHNiaSktPnJlc2VydmVkX3NlZ21lbnRzOwpMSU5FIDg5OiBvdmVycHJvdmlzaW9uX3NlZ21lbnRz
KHNiaSkKIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIFNNX0koc2Jp
KS0+b3ZwX3NlZ21lbnRzOwpMSU5FIDExMjogTUFJTl9TRUdTKHNiaSkKIMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIChTTV9JKHNiaSktPm1haW5fc2VnbWVudHMpCgpUaHVz
LCBwb3NzaWJsZSBudWxsLXBvaW50ZXIgZGVyZWZlcmVuY2VzIG1heSBvY2N1ci4KClRoZXNlIGJ1
Z3MgYXJlIGZvdW5kIGJ5IGEgc3RhdGljIGFuYWx5c2lzIHRvb2wgU1RDaGVjayB3cml0dGVuIGJ5
IHVzLgoKSSBkbyBub3Qga25vdyBob3cgdG8gY29ycmVjdGx5IGZpeCB0aGVzZSBidWdzLCBzbyBJ
IG9ubHkgcmVwb3J0IHRoZW0uCgoKQmVzdCB3aXNoZXMsCkppYS1KdSBCYWkKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1h
aWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczov
L2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
