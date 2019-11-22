Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F65C1068C6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Nov 2019 10:24:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iY5BF-0005yi-37; Fri, 22 Nov 2019 09:24:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <javier@javigon.com>) id 1iY5BD-0005yb-LA
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Nov 2019 09:24:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pdAlM/qy2J9mgq8W7ib6NaoDdjV1KLoho6CJMqImWIo=; b=VQRX8CFGB7h32OGmbWq95IL+66
 /AXXXFxAEFyMCu8lEFKZKGcwFVTrpdmEI1Gm1RAdBPoDSALSLOAJgZ9qrzpQ5rpjgddDMuQOz/GRV
 PDvrPe9aetn2RDVYqiN0h8/UTsgAH0nT69uFSMc/HVGteQ/yivUn8rWN04s1V+UuZPVI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=pdAlM/qy2J9mgq8W7ib6NaoDdjV1KLoho6CJMqImWIo=; b=W
 3/eOVNhLmg9ZF2WSARP82nNBpnm5G2M/c0SQWrFVJfGgJMXdSoHthy+r+1TZ/thzFZRzXMM377fIh
 Vi/po2f3IJQKsxL5ZOiGgS7SO6YS8B3ESjFkHMVCPkaaiyoSZmFJZcmNmFXIKt4UhfafcUfwNdlGl
 1j6dYuVZa2SfTmpk=;
Received: from mail-wm1-f65.google.com ([209.85.128.65])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iY5B6-00AHjw-Ez
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Nov 2019 09:24:43 +0000
Received: by mail-wm1-f65.google.com with SMTP id b11so6623043wmb.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 22 Nov 2019 01:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=javigon-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pdAlM/qy2J9mgq8W7ib6NaoDdjV1KLoho6CJMqImWIo=;
 b=FIsqbZuNR/tGKYTPm/IecDxhZ8w+w0s6fYOCwGn+lqZvrAWYx1Zx3SfljyluNSmFv5
 iQnRPUjHUmlHGNc4ouyyfdjOHZFV3ZtRG7FuXGbQ46yID4KX41+UKxBEqEddgRu5ATcf
 06S/L/GWhFkXR5k9Clp/TGEiNDLLPPkk5CPR2UbIAFD8OREh0AB8j4gqroPacKJk42Uk
 tvjresCi8wlRKLTjRxM3AJldL8homsZstfBUzMrMtUxR2hSE0S7soLdDX3nL1od5uZWB
 flHmSY/jHRr8nyGnyefVm33etQFJM6Y/9VixgCixy4OPUlwVM6zEFmsN9m689LGliL06
 Igyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pdAlM/qy2J9mgq8W7ib6NaoDdjV1KLoho6CJMqImWIo=;
 b=sPovxaMyXqHEKge3Qi7NpB9NNyrFX3JRWxzIQ4CTGNKhIry+llDqKzUMopH49BTm2e
 arhGBAQPbznIeGo3/kV7FbrTNhZQuNI1UU3OzWY174jbtxqxVGtdwW1Xv93kCRKE4HYW
 lSadATZfIvBAn1MAhmiO0/xbcwUx4+iuiBYMosnVc47m352uGkN4JjXN+PtwFBVTgC9T
 yTEIfFp2lFiFFG/3ATY8pAzkX9npE3QGS2y/OXgpb9dQfssx0u7uG6bqGL93L3hXnhnq
 5KpguVCRXciwKa9YV2pbBGHmv29WKEBOH1vdbCvZIomiEjl/a3oBgks5hzXLmHhRewk2
 9cDw==
X-Gm-Message-State: APjAAAXLn9xqN4jro+ZN4aW2TAl+lqZKFZwnS4ZT9fpg+b0h2ICTSfZ0
 tzuv1KeX7qmNtGQmtdr2iHbilxKlkfOlt+kQ
X-Google-Smtp-Source: APXvYqzJU5TQAoSpS0htblZXsf3FjM/E+GXif2igGH4hvMNEEyJXqpxWT6wWXUNXxiCSm0L5NBeAxg==
X-Received: by 2002:a7b:cd13:: with SMTP id f19mr10003555wmj.101.1574413195764; 
 Fri, 22 Nov 2019 00:59:55 -0800 (PST)
Received: from MacBook-Pro.gnusmas ([194.62.217.57])
 by smtp.gmail.com with ESMTPSA id f19sm7406825wrf.23.2019.11.22.00.59.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 22 Nov 2019 00:59:55 -0800 (PST)
From: =?UTF-8?q?Javier=20Gonz=C3=A1lez?= <javier@javigon.com>
To: jaegeuk@kernel.org,
	yuchao0@huawei.com
Date: Fri, 22 Nov 2019 09:59:52 +0100
Message-Id: <20191122085952.12754-1-javier@javigon.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.65 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.65 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1iY5B6-00AHjw-Ez
Subject: [f2fs-dev] [PATCH] f2fs: disble physical prealloc in LSF mount
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
Cc: =?UTF-8?q?Javier=20Gonz=C3=A1lez?= <javier.gonz@samsung.com>,
 damien.lemoal@wdc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RnJvbTogSmF2aWVyIEdvbnrDoWxleiA8amF2aWVyLmdvbnpAc2Ftc3VuZy5jb20+CgpGaXggZmls
ZSBzeXN0ZW0gY29ycnVwdGlvbiB3aGVuIHVzaW5nIExGUyBtb3VudCAoZS5nLiwgaW4gem9uZWQK
ZGV2aWNlcykuIFNlZW1zIGxpa2UgdGhlIGZhbGxiYWNrIGludG8gYnVmZmVyZWQgSS9PIGNyZWF0
ZXMgYW4KaW5jb25zaXN0ZW5jeSBpZiB0aGUgYXBwbGljYXRpb24gaXMgYXNzdW1pbmcgYm90aCBy
ZWFkIGFuZCB3cml0ZSBESU8uIEkKY2FuIGVhc2lseSByZXByb2R1Y2UgYSBjb3JydXB0aW9uIHdp
dGggYSBzaW1wbGUgUm9ja3NEQiB0ZXN0LgoKTWlnaHQgYmUgdGhhdCB0aGUgZjJmc19mb3JjZWRf
YnVmZmVyZWRfaW8gcGF0aCBicmluZ3Mgc29tZSBwcm9ibGVtcyB0b28sCmJ1dCBJIGhhdmUgbm90
IHNlZW4gb3RoZXIgZmFpbHVyZXMgYmVzaWRlcyB0aGlzIG9uZS4KClByb2JsZW0gcmVwcm9kdWNp
YmxlIHdpdGhvdXQgYSB6b25lZCBibG9jayBkZXZpY2UsIHNpbXBseSBieSBmb3JjaW5nCkxGUyBt
b3VudDoKCiAgJCBzdWRvIG1rZnMuZjJmcyAtZiAtbSAvZGV2L252bWUwbjEKICAkIHN1ZG8gbW91
bnQgL2Rldi9udm1lMG4xIC9tbnQvZjJmcwogICQgc3VkbyAgL29wdC9yb2Nrc2RiL2RiX2JlbmNo
ICAtLWJlbmNobWFya3M9ZmlsbHNlcSAtLXVzZV9leGlzdGluZ19kYj0wCiAgLS11c2VfZGlyZWN0
X3JlYWRzPXRydWUgLS11c2VfZGlyZWN0X2lvX2Zvcl9mbHVzaF9hbmRfY29tcGFjdGlvbj10cnVl
CiAgLS1kYj0vbW50L2YyZnMgLS1udW09NTAwMCAtLXZhbHVlX3NpemU9MTA0ODU3NiAtLXZlcmlm
eV9jaGVja3N1bT0xCiAgLS1ibG9ja19zaXplPTY1NTM2CgpOb3RlIHRoYXQgdGhlIG9wdGlvbnMg
dGhhdCBjYXVzZSB0aGUgcHJvYmxlbSBhcmU6CiAgLS11c2VfZGlyZWN0X3JlYWRzPXRydWUgLS11
c2VfZGlyZWN0X2lvX2Zvcl9mbHVzaF9hbmRfY29tcGFjdGlvbj10cnVlCgpGaXhlczogZjlkNmQw
NTk3Njk4ICgiZjJmczogZml4IG91dC1wbGFjZS11cGRhdGUgRElPIHdyaXRlIikKClNpZ25lZC1v
ZmYtYnk6IEphdmllciBHb256w6FsZXogPGphdmllci5nb256QHNhbXN1bmcuY29tPgotLS0KIGZz
L2YyZnMvZGF0YS5jIHwgMyAtLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9kYXRhLmMKaW5kZXggNTc1NWU4OTdh
NWYwLi5iMDQ1ZGQ2YWI2MzIgMTAwNjQ0Ci0tLSBhL2ZzL2YyZnMvZGF0YS5jCisrKyBiL2ZzL2Yy
ZnMvZGF0YS5jCkBAIC0xMDgxLDkgKzEwODEsNiBAQCBpbnQgZjJmc19wcmVhbGxvY2F0ZV9ibG9j
a3Moc3RydWN0IGtpb2NiICppb2NiLCBzdHJ1Y3QgaW92X2l0ZXIgKmZyb20pCiAJCQlyZXR1cm4g
ZXJyOwogCX0KIAotCWlmIChkaXJlY3RfaW8gJiYgYWxsb3dfb3V0cGxhY2VfZGlvKGlub2RlLCBp
b2NiLCBmcm9tKSkKLQkJcmV0dXJuIDA7Ci0KIAlpZiAoaXNfaW5vZGVfZmxhZ19zZXQoaW5vZGUs
IEZJX05PX1BSRUFMTE9DKSkKIAkJcmV0dXJuIDA7CiAKLS0gCjIuMTcuMQoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1h
aWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczov
L2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
