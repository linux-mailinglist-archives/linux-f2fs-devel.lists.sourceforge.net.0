Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F616577514
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 17 Jul 2022 10:36:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oCzlP-0000rq-E9; Sun, 17 Jul 2022 08:36:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <fmdefrancesco@gmail.com>) id 1oCzlO-0000rk-6B
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 17 Jul 2022 08:36:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KPdpIj6+zuOLFfGVczdnmA1kYYpvkGTEpBqmCCkcOr0=; b=LZny27Wtsgv9AljgABhqdT1daY
 w4px3dgKSveM6z1C2JZHXCQRsxJa3bHY1e5T7soCgVnMpBDGH9wX/BV5YhUJT8MLE14xS6r2D58Fz
 asi+Myaru1iXbRvueyrdvIadgIz68oye/wq/0459pAo9Gtu4yAkkBc4BbnAtnJcDqiiI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=KPdpIj6+zuOLFfGVczdnmA1kYYpvkGTEpBqmCCkcOr0=; b=P
 YYUTmeYara5i6LcYXW4xJwZ4JYHhPVGEIrY+mZLfi4j5XF5ZOPLWL+jgXLiasgQNZXmWCZNY1pXgO
 PG1Awh4Ztg5SGv7cB+GTCVrkK17KJlL93tpINR7fV2RBW8WDqGUh/4dZ+9jwVRJkKu2mcnO7KbSJR
 TA9EiHmCTycrw2gI=;
Received: from mail-wm1-f51.google.com ([209.85.128.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1oCzlK-0006qB-G5
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 17 Jul 2022 08:36:28 +0000
Received: by mail-wm1-f51.google.com with SMTP id
 ay11-20020a05600c1e0b00b003a3013da120so5827362wmb.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 17 Jul 2022 01:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KPdpIj6+zuOLFfGVczdnmA1kYYpvkGTEpBqmCCkcOr0=;
 b=ho0FfW0pzlLfTloSwm6NgaWVW4pOv3rtpTRxR10iGG3jkA9gzty0hmbnjYYKm4MVu1
 6KL5aXu14gFYJo419YFIBHhoNhaKn7cCtWnm6VIi8mpaFVy2w6gP+OpHpUZMxTKYMssv
 Bw5QNXHf9h65o+bnmZ/A7EcOzv2z/jeoczzZswXfyLQqtf5dzkcJRoSmLx7eUDB8tK0m
 F6NYIoJQb+rH8WRfEoq7DEYRGHZTraUcf9Wh3VuffqtuRC/CGSPU/ivWkpxj1N6e2wr2
 lkcB0CHehDxga/HVL1qJG2aUZnOohW420anJm1Nsy3GD5F5CBjg9MJ0c7Si3y8loiPgp
 bdkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KPdpIj6+zuOLFfGVczdnmA1kYYpvkGTEpBqmCCkcOr0=;
 b=H0Mu69crzvVIgVRj3rEICz8fXAsst9+LuivhtG3OWcuo4Lpg/NbJhEudhL7TTPkW/G
 1CQV7TQLv0tlfdTakeVub7cIurn8/jWLkyf76Y5TVCY4E8Clhfz5ZRSBuNcs+2Rxex+g
 fXgfaV7m+Yu0xPoTS65s2c2C9zHWIex1kXIZzq8zMolWPwf3G7X0GNK46Gt+A6fnvwxr
 NVZu5yeRsMecGkOv+3D+3ijFHiRH6RF4Y0kZOEwks9jaKQR1kCXC7ynDyU+yZ9MwLuNx
 PrFwKoDLMZdPYbPkAb3HA6PUTcm8sw8HZTFYy/p6qDYxKPg4HSnkVDegb1VW5+G3pOqJ
 x3Jw==
X-Gm-Message-State: AJIora8rmIiW/dukPK/l2XbSrNd4gWmbJnI1Gw6dmO3PccELhCVPy91S
 IBlEwpSye4thiV3K3uGehaA=
X-Google-Smtp-Source: AGRyM1sqobUZzrErJtyW6GoiEJMsugB4ZhdeqcqwoPOaR3IhOIV61PAuC34TD9zvVdZFbfTK/NPJdg==
X-Received: by 2002:a05:600c:3399:b0:3a3:f1e:ebd8 with SMTP id
 o25-20020a05600c339900b003a30f1eebd8mr9493905wmp.6.1658046979942; 
 Sun, 17 Jul 2022 01:36:19 -0700 (PDT)
Received: from localhost.localdomain
 (host-95-235-102-55.retail.telecomitalia.it. [95.235.102.55])
 by smtp.gmail.com with ESMTPSA id
 r8-20020a5d52c8000000b0021d65e9d449sm8117515wrv.73.2022.07.17.01.36.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 01:36:18 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 Nick Terrell <terrelln@fb.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
Date: Sun, 17 Jul 2022 10:36:13 +0200
Message-Id: <20220717083613.3861-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: f2fs_copy_page() is a wrapper around two kmap() + one
 memcpy()
 from/to the mapped pages. It unnecessarily duplicates a kernel API and it
 makes use of kmap(), which is being deprecated in favor of kmap [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [fmdefrancesco[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.51 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.51 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1oCzlK-0006qB-G5
Subject: [f2fs-dev] [PATCH] f2fs: Delete f2fs_copy_page() and replace with
 memcpy_page()
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
Cc: Christoph Hellwig <hch@infradead.org>, Ira Weiny <ira.weiny@intel.com>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

ZjJmc19jb3B5X3BhZ2UoKSBpcyBhIHdyYXBwZXIgYXJvdW5kIHR3byBrbWFwKCkgKyBvbmUgbWVt
Y3B5KCkgZnJvbS90bwp0aGUgbWFwcGVkIHBhZ2VzLiBJdCB1bm5lY2Vzc2FyaWx5IGR1cGxpY2F0
ZXMgYSBrZXJuZWwgQVBJIGFuZCBpdCBtYWtlcwp1c2Ugb2Yga21hcCgpLCB3aGljaCBpcyBiZWlu
ZyBkZXByZWNhdGVkIGluIGZhdm9yIG9mIGttYXBfbG9jYWxfcGFnZSgpLgoKVHdvIG1haW4gcHJv
YmxlbXMgd2l0aCBrbWFwKCk6ICgxKSBJdCBjb21lcyB3aXRoIGFuIG92ZXJoZWFkIGFzIG1hcHBp
bmcKc3BhY2UgaXMgcmVzdHJpY3RlZCBhbmQgcHJvdGVjdGVkIGJ5IGEgZ2xvYmFsIGxvY2sgZm9y
IHN5bmNocm9uaXphdGlvbiBhbmQKKDIpIGl0IGFsc28gcmVxdWlyZXMgZ2xvYmFsIFRMQiBpbnZh
bGlkYXRpb24gd2hlbiB0aGUga21hcOKAmXMgcG9vbCB3cmFwcwphbmQgaXQgbWlnaHQgYmxvY2sg
d2hlbiB0aGUgbWFwcGluZyBzcGFjZSBpcyBmdWxseSB1dGlsaXplZCB1bnRpbCBhIHNsb3QKYmVj
b21lcyBhdmFpbGFibGUuCgpXaXRoIGttYXBfbG9jYWxfcGFnZSgpIHRoZSBtYXBwaW5ncyBhcmUg
cGVyIHRocmVhZCwgQ1BVIGxvY2FsLCBjYW4gdGFrZQpwYWdlIGZhdWx0cywgYW5kIGNhbiBiZSBj
YWxsZWQgZnJvbSBhbnkgY29udGV4dCAoaW5jbHVkaW5nIGludGVycnVwdHMpLgpJdCBpcyBmYXN0
ZXIgdGhhbiBrbWFwKCkgaW4ga2VybmVscyB3aXRoIEhJR0hNRU0gZW5hYmxlZC4gVGhlcmVmb3Jl
LCBpdHMKdXNlIGluIF9fY2xvbmVfYmxrYWRkcnMoKSBpcyBzYWZlIGFuZCBzaG91bGQgYmUgcHJl
ZmVycmVkLgoKRGVsZXRlIGYyZnNfY29weV9wYWdlKCkgYW5kIHVzZSBhIHBsYWluIG1lbWNweV9w
YWdlKCkgaW4gdGhlIG9ubHkgb25lCnNpdGUgY2FsbGluZyB0aGUgcmVtb3ZlZCBmdW5jdGlvbi4g
bWVtY3B5X3BhZ2UoKSBhdm9pZHMgb3BlbiBjb2RpbmcgdHdvCmttYXBfbG9jYWxfcGFnZSgpICsg
b25lIG1lbWNweSgpIGJldHdlZW4gdGhlIHR3byBrZXJuZWwgdmlydHVhbCBhZGRyZXNzZXMuCgpT
dWdnZXN0ZWQtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAaW5mcmFkZWFkLm9yZz4KU3VnZ2Vz
dGVkLWJ5OiBJcmEgV2VpbnkgPGlyYS53ZWlueUBpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IEZh
YmlvIE0uIERlIEZyYW5jZXNjbyA8Zm1kZWZyYW5jZXNjb0BnbWFpbC5jb20+Ci0tLQoKVGhpcyBw
YXRjaCBleHRlbmRzIHRoZSBzY29wZSBhbmQgcmVwbGFjZXMgImYyZnM6IFVzZSBtZW1jcHlfcGFn
ZSgpIGluCmYyZnNfY29weV9wYWdlKCkiLCBhcyBzdWdnZXN0ZWQgYnkgQ2hyaXN0b3BoIEhlbGx3
aWcgKHRoYW5rcyEpOgpodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sL1l0T3lXT0tGTjlyYW1V
eWJAaW5mcmFkZWFkLm9yZy8KCiBmcy9mMmZzL2YyZnMuaCB8IDEwIC0tLS0tLS0tLS0KIGZzL2Yy
ZnMvZmlsZS5jIHwgIDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDExIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmgK
aW5kZXggZDliYmVjZDAwOGQyLi41MmJlM2UyM2FlN2MgMTAwNjQ0Ci0tLSBhL2ZzL2YyZnMvZjJm
cy5oCisrKyBiL2ZzL2YyZnMvZjJmcy5oCkBAIC0yNjk2LDE2ICsyNjk2LDYgQEAgc3RhdGljIGlu
bGluZSBzdHJ1Y3QgcGFnZSAqZjJmc19wYWdlY2FjaGVfZ2V0X3BhZ2UoCiAJcmV0dXJuIHBhZ2Vj
YWNoZV9nZXRfcGFnZShtYXBwaW5nLCBpbmRleCwgZmdwX2ZsYWdzLCBnZnBfbWFzayk7CiB9CiAK
LXN0YXRpYyBpbmxpbmUgdm9pZCBmMmZzX2NvcHlfcGFnZShzdHJ1Y3QgcGFnZSAqc3JjLCBzdHJ1
Y3QgcGFnZSAqZHN0KQotewotCWNoYXIgKnNyY19rYWRkciA9IGttYXAoc3JjKTsKLQljaGFyICpk
c3Rfa2FkZHIgPSBrbWFwKGRzdCk7Ci0KLQltZW1jcHkoZHN0X2thZGRyLCBzcmNfa2FkZHIsIFBB
R0VfU0laRSk7Ci0Ja3VubWFwKGRzdCk7Ci0Ja3VubWFwKHNyYyk7Ci19Ci0KIHN0YXRpYyBpbmxp
bmUgdm9pZCBmMmZzX3B1dF9wYWdlKHN0cnVjdCBwYWdlICpwYWdlLCBpbnQgdW5sb2NrKQogewog
CWlmICghcGFnZSkKZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZmlsZS5jIGIvZnMvZjJmcy9maWxlLmMK
aW5kZXggYmQxNGNlZjFiMDhmLi44ZDk4NGFlYjI3MGYgMTAwNjQ0Ci0tLSBhL2ZzL2YyZnMvZmls
ZS5jCisrKyBiL2ZzL2YyZnMvZmlsZS5jCkBAIC0xMjc4LDcgKzEyNzgsNyBAQCBzdGF0aWMgaW50
IF9fY2xvbmVfYmxrYWRkcnMoc3RydWN0IGlub2RlICpzcmNfaW5vZGUsIHN0cnVjdCBpbm9kZSAq
ZHN0X2lub2RlLAogCQkJCWYyZnNfcHV0X3BhZ2UocHNyYywgMSk7CiAJCQkJcmV0dXJuIFBUUl9F
UlIocGRzdCk7CiAJCQl9Ci0JCQlmMmZzX2NvcHlfcGFnZShwc3JjLCBwZHN0KTsKKwkJCW1lbWNw
eV9wYWdlKHBkc3QsIDAsIHBzcmMsIDAsIFBBR0VfU0laRSk7CiAJCQlzZXRfcGFnZV9kaXJ0eShw
ZHN0KTsKIAkJCWYyZnNfcHV0X3BhZ2UocGRzdCwgMSk7CiAJCQlmMmZzX3B1dF9wYWdlKHBzcmMs
IDEpOwotLSAKMi4zNy4xCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxA
bGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3Rz
L2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
