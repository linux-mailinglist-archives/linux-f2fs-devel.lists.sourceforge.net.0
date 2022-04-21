Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B8C50AB59
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Apr 2022 00:19:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nhf8s-0005J9-UT; Thu, 21 Apr 2022 22:19:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bart.vanassche@gmail.com>) id 1nhf8r-0005Ig-6y
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 22:19:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zKlwLvw1oyPlP5h+/z/T3J3yP4JdNEfHr/2zpOsAWO4=; b=b45yfKbY46blPEBa4svdCmvajQ
 vAS5F9SYO5T53ykQ3uwvuoQsOv+OIYi1j5NQYzoJo2XctTjsnziGc9ZpDan3e+9ct8uzpIKkyM4/g
 F3e+QGGtWssWwBGUmaPY9hIR1l97lIGSr7N+1IYTNPaYFOcuAbkg30Yw/pqC1nb1xw4k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zKlwLvw1oyPlP5h+/z/T3J3yP4JdNEfHr/2zpOsAWO4=; b=LbFS8JH0aVh9yedCfqI54ovh7w
 qcmDyXWxwpa1ASq1IyFkcGN3Ad2ZtCeJ0Nf173hKuUc/OuntPdYXQJXTUTlLr0OwQpb7Q42+8MzmQ
 SINdyM69IrOiDvtS538LLYMsTHhIAaX9uSmH0dqU4+fvh+f1N7fR97DPdK6DMpNlPCsI=;
Received: from mail-pl1-f175.google.com ([209.85.214.175])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nhf8q-005sPi-Iy
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 22:19:14 +0000
Received: by mail-pl1-f175.google.com with SMTP id b7so6785331plh.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Apr 2022 15:19:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zKlwLvw1oyPlP5h+/z/T3J3yP4JdNEfHr/2zpOsAWO4=;
 b=X7+b/Rr0wTsaIsx0q0PVqEhTMFZ5TV/9SQRBwneLkRms067aYjOBLObWxOFXd1i6Il
 kZJ/0RalKD25/kYzW+esmKEiAXoEkDV9H78oSUsN+847cDlYDJ5wqWC9irB2zK3LT+Lr
 20PyvLIi7ZlSZwGd/oLebZiS/ghojI7i1uIK5Wypo4gR6K4K3NK21Z8a5rX/KOxuz00w
 padApzA71QJNdurRxvbXKgLpR7CDDrVfBwK+RV1g/OqRqp8CenXLBQ0eGK3tz7QTyBON
 AGCn0plNDJPnJKB9UHTBLCtE9ZHf8G+Bc1wCV+MczTXu/THdasSDPYKzcklGoCyPPyCJ
 Ku4w==
X-Gm-Message-State: AOAM530jKTGfJrBSo9zYm9/BxEd9UKWjw5rsYN1hngd2kVPkdd/BIh0r
 iEtNytfeo8NI2PIW5F/vzTlYkz8uDoiaFA==
X-Google-Smtp-Source: ABdhPJxn194Mo3U9CH6kx7Ab0xDX+EjO1cT6C2mriTxBRX9k1nRYOsTQOS8Kiq4YoWBmQpdQs078bQ==
X-Received: by 2002:a17:902:c951:b0:15b:55ea:5087 with SMTP id
 i17-20020a170902c95100b0015b55ea5087mr1552683pla.76.1650579546928; 
 Thu, 21 Apr 2022 15:19:06 -0700 (PDT)
Received: from bvanassche-linux.mtv.corp.google.com
 ([2620:15c:211:201:a034:31d8:ca4e:1f35])
 by smtp.gmail.com with ESMTPSA id
 hi21-20020a17090b30d500b001cd4989ff4csm3794876pjb.19.2022.04.21.15.19.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 15:19:06 -0700 (PDT)
From: Bart Van Assche <bvanassche@acm.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Thu, 21 Apr 2022 15:18:17 -0700
Message-Id: <20220421221836.3935616-13-bvanassche@acm.org>
X-Mailer: git-send-email 2.36.0.rc2.479.g8af0fa9b8e-goog
In-Reply-To: <20220421221836.3935616-1-bvanassche@acm.org>
References: <20220421221836.3935616-1-bvanassche@acm.org>
MIME-Version: 1.0
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Use uint64_t instead of __u64 in the definitions of the endianness
    conversion macros. This patch fixes the following compiler warning: dir.c:
    In function ‘f2fs_create’: dir.c:785:16: warning: format ‘%lx’ expects
    argument of type ‘long unsigned int’, but argument 12 has type ‘long
    long unsigned int’ [-Wformat=] 785 | [...] 
 
 Content analysis details:   (0.5 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [bart.vanassche[at]gmail.com]
  0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
                             mail domains are different
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.214.175 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.214.175 listed in list.dnswl.org]
  0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
                             EnvelopeFrom freemail headers are
                             different
X-Headers-End: 1nhf8q-005sPi-Iy
Subject: [f2fs-dev] [PATCH 12/31] f2fs_fs.h: Use standard fixed width
 integer types
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
Cc: Bart Van Assche <bvanassche@acm.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

VXNlIHVpbnQ2NF90IGluc3RlYWQgb2YgX191NjQgaW4gdGhlIGRlZmluaXRpb25zIG9mIHRoZSBl
bmRpYW5uZXNzCmNvbnZlcnNpb24gbWFjcm9zLiBUaGlzIHBhdGNoIGZpeGVzIHRoZSBmb2xsb3dp
bmcgY29tcGlsZXIgd2FybmluZzoKCmRpci5jOiBJbiBmdW5jdGlvbiDigJhmMmZzX2NyZWF0ZeKA
mToKZGlyLmM6Nzg1OjE2OiB3YXJuaW5nOiBmb3JtYXQg4oCYJWx44oCZIGV4cGVjdHMgYXJndW1l
bnQgb2YgdHlwZSDigJhsb25nIHVuc2lnbmVkIGludOKAmSwgYnV0IGFyZ3VtZW50IDEyIGhhcyB0
eXBlIOKAmGxvbmcgbG9uZyB1bnNpZ25lZCBpbnTigJkgWy1XZm9ybWF0PV0KICA3ODUgfCAgICAg
ICAgIE1TRygxLCAiSW5mbzogQ3JlYXRlICVzIC0+ICVzXG4iCiAgICAgIHwgICAgICAgICAgICAg
ICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgouLi9pbmNsdWRlL2YyZnNfZnMuaDoyNTI6MzI6
IG5vdGU6IGluIGRlZmluaXRpb24gb2YgbWFjcm8g4oCYTVNH4oCZCiAgMjUyIHwgICAgICAgICAg
ICAgICAgICAgICAgICAgcHJpbnRmKGZtdCwgIyNfX1ZBX0FSR1NfXyk7ICAgICAgICAgICAgICAg
ICAgICAgXAogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn4KClNpZ25l
ZC1vZmYtYnk6IEJhcnQgVmFuIEFzc2NoZSA8YnZhbmFzc2NoZUBhY20ub3JnPgotLS0KIGZzY2sv
bW91bnQuYyAgICAgIHwgIDIgKy0KIGluY2x1ZGUvZjJmc19mcy5oIHwgMTYgKysrKysrKystLS0t
LS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZnNjay9tb3VudC5jIGIvZnNjay9tb3VudC5jCmluZGV4IGYxNTI2MGUwMmNh
Yi4uZTA3NWQzMTg0ZjgzIDEwMDY0NAotLS0gYS9mc2NrL21vdW50LmMKKysrIGIvZnNjay9tb3Vu
dC5jCkBAIC0yNTAsNyArMjUwLDcgQEAgdm9pZCBwcmludF9pbm9kZV9pbmZvKHN0cnVjdCBmMmZz
X3NiX2luZm8gKnNiaSwKIAkJTVNHKDAsICIgLSBGaWxlIG5hbWUgICAgICAgICA6ICVzJXNcbiIs
IGVuLAogCQkJCWVuY19uYW1lID8gIiA8ZW5jcnlwdGVkPiIgOiAiIik7CiAJCXNldGxvY2FsZShM
Q19BTEwsICIiKTsKLQkJTVNHKDAsICIgLSBGaWxlIHNpemUgICAgICAgICA6ICUnbGx1IChieXRl
cylcbiIsCisJCU1TRygwLCAiIC0gRmlsZSBzaXplICAgICAgICAgOiAlJyIgUFJJdTY0ICIgKGJ5
dGVzKVxuIiwKIAkJCQlsZTY0X3RvX2NwdShpbm9kZS0+aV9zaXplKSk7CiAJCXJldHVybjsKIAl9
CmRpZmYgLS1naXQgYS9pbmNsdWRlL2YyZnNfZnMuaCBiL2luY2x1ZGUvZjJmc19mcy5oCmluZGV4
IDc4MDRkZDE1OGRlNC4uY2ZkM2I3MTFmMjg4IDEwMDY0NAotLS0gYS9pbmNsdWRlL2YyZnNfZnMu
aAorKysgYi9pbmNsdWRlL2YyZnNfZnMuaApAQCAtMTg4LDEyICsxODgsMTIgQEAgc3RhdGljIGlu
bGluZSB1aW50NjRfdCBic3dhcF82NCh1aW50NjRfdCB2YWwpCiAjZW5kaWYKIAogI2lmIF9fQllU
RV9PUkRFUiA9PSBfX0xJVFRMRV9FTkRJQU4KLSNkZWZpbmUgbGUxNl90b19jcHUoeCkJKChfX3Ux
NikoeCkpCi0jZGVmaW5lIGxlMzJfdG9fY3B1KHgpCSgoX191MzIpKHgpKQotI2RlZmluZSBsZTY0
X3RvX2NwdSh4KQkoKF9fdTY0KSh4KSkKLSNkZWZpbmUgY3B1X3RvX2xlMTYoeCkJKChfX3UxNiko
eCkpCi0jZGVmaW5lIGNwdV90b19sZTMyKHgpCSgoX191MzIpKHgpKQotI2RlZmluZSBjcHVfdG9f
bGU2NCh4KQkoKF9fdTY0KSh4KSkKKyNkZWZpbmUgbGUxNl90b19jcHUoeCkJKCh1aW50MTZfdCko
eCkpCisjZGVmaW5lIGxlMzJfdG9fY3B1KHgpCSgodWludDMyX3QpKHgpKQorI2RlZmluZSBsZTY0
X3RvX2NwdSh4KQkoKHVpbnQ2NF90KSh4KSkKKyNkZWZpbmUgY3B1X3RvX2xlMTYoeCkJKCh1aW50
MTZfdCkoeCkpCisjZGVmaW5lIGNwdV90b19sZTMyKHgpCSgodWludDMyX3QpKHgpKQorI2RlZmlu
ZSBjcHVfdG9fbGU2NCh4KQkoKHVpbnQ2NF90KSh4KSkKICNlbGlmIF9fQllURV9PUkRFUiA9PSBf
X0JJR19FTkRJQU4KICNkZWZpbmUgbGUxNl90b19jcHUoeCkJYnN3YXBfMTYoeCkKICNkZWZpbmUg
bGUzMl90b19jcHUoeCkJYnN3YXBfMzIoeCkKQEAgLTI5MSwxMCArMjkxLDEwIEBAIHN0YXRpYyBp
bmxpbmUgdWludDY0X3QgYnN3YXBfNjQodWludDY0X3QgdmFsKQogCWRvIHsJCQkJCQkJCVwKIAkJ
YXNzZXJ0KHNpemVvZigocHRyKS0+bWVtYmVyKSA9PSA4KTsJCQlcCiAJCWlmIChjLmxheW91dCkJ
CQkJCQlcCi0JCQlwcmludGYoIiUtMzBzICVsbHVcbiIsCQkJCVwKKwkJCXByaW50ZigiJS0zMHMg
JSIgUFJJdTY0ICJcbiIsCQkJXAogCQkJI21lbWJlciI6IiwgbGU2NF90b19jcHUoKChwdHIpLT5t
ZW1iZXIpKSk7CVwKIAkJZWxzZQkJCQkJCQlcCi0JCQlwcmludGYoIiUtMzBzIiAiXHRcdFsweCU4
bGx4IDogJWxsdV1cbiIsCVwKKwkJCXByaW50ZigiJS0zMHMiICJcdFx0WzB4JTgiIFBSSXg2NCAi
IDogJSIgUFJJdTY0ICJdXG4iLAlcCiAJCQkjbWVtYmVyLCBsZTY0X3RvX2NwdSgoKHB0ciktPm1l
bWJlcikpLAkJXAogCQkJbGU2NF90b19jcHUoKChwdHIpLT5tZW1iZXIpKSk7CQkJXAogCX0gd2hp
bGUgKDApCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8v
bGludXgtZjJmcy1kZXZlbAo=
