Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFFB50AB6A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Apr 2022 00:19:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nhf9I-0001s3-EZ; Thu, 21 Apr 2022 22:19:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bart.vanassche@gmail.com>) id 1nhf9H-0001rd-8n
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 22:19:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XlxerKjvBi2IcBYPwLCbTg46d9K0jdupvvo9sd6jB40=; b=ZQRpM+96oqHOV8ArRGaPrph/Ht
 FpWw9nmuX9C23joZyIVBnEI0RVkkTosxXmtE4KsjFCRKaa6kl02IyANsly2d6dMbnWXR17t3Jtpry
 joBG+iWsNQ7cil3BbMIkKJpaZ5i5zkSn2joOHPgumECQ9+80o/13PZ68OzoDgsgab1y8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XlxerKjvBi2IcBYPwLCbTg46d9K0jdupvvo9sd6jB40=; b=gDnmK5a8AlhrQU2Vq0wUp+Ics9
 2uk2s+JgSLmzUJWEF0cS3jLTDgRf8Vd2OKW+WG4+//Uf3rZyW/GgRqtGL8Cpa9xhQljgIo5u7ZjeW
 lrQwoPssDk8lo4EBE3KxSXBsTklNzV7irUzfg5sb/0YZgThV2UxiYh9dMYYmnuZtIAGQ=;
Received: from mail-pf1-f182.google.com ([209.85.210.182])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nhf9F-005sSJ-01
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 22:19:37 +0000
Received: by mail-pf1-f182.google.com with SMTP id bo5so6250049pfb.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Apr 2022 15:19:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XlxerKjvBi2IcBYPwLCbTg46d9K0jdupvvo9sd6jB40=;
 b=7KZ9ns2CkgubXsWdVT+oz585n44lVPWwU0BDNvOG2LBo9neVsZsSihl8yXQLi1/zoK
 eZGpbq0rRYtaU8uIMeMbLiiTcIUHj71Owcq0rJmUksOv7KAbOMf/AsWG1Lc11CsaBY+2
 X0dr57s/9nk/891RkodhNVwyfrWwxsTWEZ6jUitFZZsvqOx/q2XjzaqSGe10S/Nw+23M
 w9r1roYdir2A7xHvCtCVBsCCaywiE8AuF8qQnvE0Bsb3YCggIeS0ZRsTMEjDBywNC3Sy
 njjHf+tPclz9jFdAQVVeM9xzPqhsoRAiSy8vmEsOzM3DF4QstJPjm6yEOqld98P5mrMs
 kxLA==
X-Gm-Message-State: AOAM530hdFzA7Ma7YkWd1T8+w9WCeiR/aOBJHugiSl1L+DqFkpVl29ct
 cAGSTYrKWIcqc5ZgXEuRu4w=
X-Google-Smtp-Source: ABdhPJxo585/U5wJO4jr4zlVzONE5jGiBbNZV7ZX+qr6HLTyN+HtnxrzoVOCuP1c4hEl74HovthMpg==
X-Received: by 2002:a05:6a00:1988:b0:4fa:c15d:190d with SMTP id
 d8-20020a056a00198800b004fac15d190dmr1740598pfl.44.1650579571346; 
 Thu, 21 Apr 2022 15:19:31 -0700 (PDT)
Received: from bvanassche-linux.mtv.corp.google.com
 ([2620:15c:211:201:a034:31d8:ca4e:1f35])
 by smtp.gmail.com with ESMTPSA id
 hi21-20020a17090b30d500b001cd4989ff4csm3794876pjb.19.2022.04.21.15.19.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 15:19:30 -0700 (PDT)
From: Bart Van Assche <bvanassche@acm.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Thu, 21 Apr 2022 15:18:33 -0700
Message-Id: <20220421221836.3935616-29-bvanassche@acm.org>
X-Mailer: git-send-email 2.36.0.rc2.479.g8af0fa9b8e-goog
In-Reply-To: <20220421221836.3935616-1-bvanassche@acm.org>
References: <20220421221836.3935616-1-bvanassche@acm.org>
MIME-Version: 1.0
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  This patch prevents that older compilers report the following
    warning: f2fs_format.c: In function ‘f2fs_prepare_super_block’: ../include/f2fs_fs.h:350:26:
    error: conversion from ‘unsigned int’ to ‘__uint16_t’ {aka ‘short
    unsigned int’} changes value from [...] 
 
 Content analysis details:   (0.5 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.210.182 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
                             mail domains are different
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [bart.vanassche[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.210.182 listed in wl.mailspike.net]
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
  0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
                             EnvelopeFrom freemail headers are
                             different
X-Headers-End: 1nhf9F-005sSJ-01
Subject: [f2fs-dev] [PATCH 28/31] Suppress a compiler warning about integer
 truncation
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

VGhpcyBwYXRjaCBwcmV2ZW50cyB0aGF0IG9sZGVyIGNvbXBpbGVycyByZXBvcnQgdGhlIGZvbGxv
d2luZyB3YXJuaW5nOgoKZjJmc19mb3JtYXQuYzogSW4gZnVuY3Rpb24g4oCYZjJmc19wcmVwYXJl
X3N1cGVyX2Jsb2Nr4oCZOgouLi9pbmNsdWRlL2YyZnNfZnMuaDozNTA6MjY6IGVycm9yOiBjb252
ZXJzaW9uIGZyb20g4oCYdW5zaWduZWQgaW504oCZIHRvIOKAmF9fdWludDE2X3TigJkge2FrYSDi
gJhzaG9ydCB1bnNpZ25lZCBpbnTigJl9IGNoYW5nZXMgdmFsdWUgZnJvbSDigJg0MDc2MTUwODAw
4oCZIHRvIOKAmDgyMDjigJkgWy1XZXJyb3I9b3ZlcmZsb3ddCiAgMzUwIHwgI2RlZmluZSBGMkZT
X1NVUEVSX01BR0lDIDB4RjJGNTIwMTAgLyogRjJGUyBNYWdpYyBOdW1iZXIgKi8KICAgICAgfCAg
ICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fgogLi4vaW5jbHVkZS9mMmZzX2ZzLmg6
NTc0OjQ5OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYY3B1X3RvX2xlMTbigJkKICA1
NzQgfCAjZGVmaW5lIHNldF9zYl9sZTE2KG1lbWJlciwgdmFsKSAgKHNiLT5tZW1iZXIgPSBjcHVf
dG9fbGUxNih2YWwpKQogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIF5+fn5+fn5+fn5+CgpTaWduZWQtb2ZmLWJ5OiBCYXJ0IFZhbiBBc3NjaGUg
PGJ2YW5hc3NjaGVAYWNtLm9yZz4KLS0tCiBpbmNsdWRlL2YyZnNfZnMuaCB8IDI0ICsrKysrKysr
KysrKy0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZjJmc19mcy5oIGIvaW5jbHVkZS9mMmZz
X2ZzLmgKaW5kZXggNzNkYzQ4ZTI1ZWMwLi5iYzU3ZGQwNzgxOWEgMTAwNjQ0Ci0tLSBhL2luY2x1
ZGUvZjJmc19mcy5oCisrKyBiL2luY2x1ZGUvZjJmc19mcy5oCkBAIC01NzksMTQgKzU3OSwxNCBA
QCBzdHJ1Y3QgZjJmc19jb25maWd1cmF0aW9uIHsKICNkZWZpbmUgZ2V0X25ld3NiX2xlMzIobWVt
YmVyKQkJCWxlMzJfdG9fY3B1KG5ld19zYi0+bWVtYmVyKQogI2RlZmluZSBnZXRfbmV3c2JfbGUx
NihtZW1iZXIpCQkJbGUxNl90b19jcHUobmV3X3NiLT5tZW1iZXIpCiAKLSNkZWZpbmUgc2V0X3Ni
KG1lbWJlciwgdmFsKQlcCisjZGVmaW5lIHNldF9zYihtZW1iZXIsIHZhbCkJCQkJCQlcCiAJCQlk
byB7CQkJCQkJXAotCQkJCXR5cGVvZihzYi0+bWVtYmVyKSB0OwkJCVwKKwkJCQl0eXBlb2Yoc2It
Pm1lbWJlcikgdCA9ICh2YWwpOwkJXAogCQkJCXN3aXRjaCAoc2l6ZW9mKHQpKSB7CQkJXAotCQkJ
CWNhc2UgODogc2V0X3NiX2xlNjQobWVtYmVyLCB2YWwpOyBicmVhazsgXAotCQkJCWNhc2UgNDog
c2V0X3NiX2xlMzIobWVtYmVyLCB2YWwpOyBicmVhazsgXAotCQkJCWNhc2UgMjogc2V0X3NiX2xl
MTYobWVtYmVyLCB2YWwpOyBicmVhazsgXAotCQkJCX0gXAorCQkJCWNhc2UgODogc2V0X3NiX2xl
NjQobWVtYmVyLCB0KTsgYnJlYWs7CVwKKwkJCQljYXNlIDQ6IHNldF9zYl9sZTMyKG1lbWJlciwg
dCk7IGJyZWFrOwlcCisJCQkJY2FzZSAyOiBzZXRfc2JfbGUxNihtZW1iZXIsIHQpOyBicmVhazsJ
XAorCQkJCX0JCQkJCVwKIAkJCX0gd2hpbGUoMCkKIAogI2RlZmluZSBnZXRfc2IobWVtYmVyKQkJ
XApAQCAtNjE3LDE0ICs2MTcsMTQgQEAgc3RydWN0IGYyZnNfY29uZmlndXJhdGlvbiB7CiAjZGVm
aW5lIGdldF9jcF9sZTMyKG1lbWJlcikJCQlsZTMyX3RvX2NwdShjcC0+bWVtYmVyKQogI2RlZmlu
ZSBnZXRfY3BfbGUxNihtZW1iZXIpCQkJbGUxNl90b19jcHUoY3AtPm1lbWJlcikKIAotI2RlZmlu
ZSBzZXRfY3AobWVtYmVyLCB2YWwpCVwKKyNkZWZpbmUgc2V0X2NwKG1lbWJlciwgdmFsKQkJCQkJ
CVwKIAkJCWRvIHsJCQkJCQlcCi0JCQkJdHlwZW9mKGNwLT5tZW1iZXIpIHQ7CQkJXAorCQkJCXR5
cGVvZihjcC0+bWVtYmVyKSB0ID0gKHZhbCk7CQlcCiAJCQkJc3dpdGNoIChzaXplb2YodCkpIHsJ
CQlcCi0JCQkJY2FzZSA4OiBzZXRfY3BfbGU2NChtZW1iZXIsIHZhbCk7IGJyZWFrOyBcCi0JCQkJ
Y2FzZSA0OiBzZXRfY3BfbGUzMihtZW1iZXIsIHZhbCk7IGJyZWFrOyBcCi0JCQkJY2FzZSAyOiBz
ZXRfY3BfbGUxNihtZW1iZXIsIHZhbCk7IGJyZWFrOyBcCi0JCQkJfSBcCisJCQkJY2FzZSA4OiBz
ZXRfY3BfbGU2NChtZW1iZXIsIHQpOyBicmVhazsJXAorCQkJCWNhc2UgNDogc2V0X2NwX2xlMzIo
bWVtYmVyLCB0KTsgYnJlYWs7CVwKKwkJCQljYXNlIDI6IHNldF9jcF9sZTE2KG1lbWJlciwgdCk7
IGJyZWFrOwlcCisJCQkJfQkJCQkJXAogCQkJfSB3aGlsZSgwKQogCiAjZGVmaW5lIGdldF9jcCht
ZW1iZXIpCQlcCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5z
b3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGlu
Zm8vbGludXgtZjJmcy1kZXZlbAo=
