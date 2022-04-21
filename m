Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3E350AB5C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Apr 2022 00:19:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nhf8v-0005K7-5W; Thu, 21 Apr 2022 22:19:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bart.vanassche@gmail.com>) id 1nhf8s-0005J4-Q3
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 22:19:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OcZNFr7vtTE2Fr5kWY9jTQTvvKvLe7Py2tdduuLBuHk=; b=Lto6uKrRqZPFip/XjUZuOnTRZM
 BYBgNCCfyju6rJsKxyR8Y0UlOfYTOl0oVd1WEvTvDBWyCLWd+NbhVA3S4uBk4Qmr3ER3/xgoYn6Ws
 j3IQhTdyzc9oVTrXeharbPJHFpLxmvIGRyIW9VIiWUaTNfbBK/KQTLH3HinXfptW8OpU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OcZNFr7vtTE2Fr5kWY9jTQTvvKvLe7Py2tdduuLBuHk=; b=ITl/7J9FM6dqbBAZrjtlZFokZU
 gBJSRxornodFFfS0mtd/iQstfOUiPI0RYDNp6DdW2JtYOK5EctQsxdcO6excYki++M7FSKrTUQEPp
 x1cKWpkCwgWz7CuO4ibQZu/Peo2jspml4IsF4nY3EHcK4u3U757ELc+vHGT/PmJ/aERY=;
Received: from mail-pl1-f177.google.com ([209.85.214.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nhf8p-0002wC-6w
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 22:19:15 +0000
Received: by mail-pl1-f177.google.com with SMTP id u15so3382481ple.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Apr 2022 15:19:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OcZNFr7vtTE2Fr5kWY9jTQTvvKvLe7Py2tdduuLBuHk=;
 b=EyemP02TgTpdtxVqaQSQpJZRD1tw2MHD7F+poJQA9IqoLijcUXHwgxLgNRtx3W7lxG
 +qCo0uAjXQiHyoEhCdJ7SI+M0AqxcBCY2bdIi6+hV7GUFkkS8OewbsTiZoS8ptFT7Yif
 7zJUw+ykZYVtfb6DKhTUxb/xEggSpuhuk58RATDgwuoq8SFZxW2DHCvdkkRrXPn7PMc0
 OLQu6mE/v+xW8kmluQ2Ot43dbeBOSfIrESnYI3BygiAY/niDWooADstjHaTLi5JFzN2F
 PMXXe8jxchmHbWwAwG8p5Yfxg//mq7GwA0K9yHXzqN3k18bmXyTURH4vJOVv+KtCd1fg
 6AZQ==
X-Gm-Message-State: AOAM533OJl0CEF6bJMtXnj/0saVaIUAZ8cxMbG/IDlxYdpqjWMmP6ZR+
 GEgBGccpAMnJbhBa4v/py5zH29p+bC1Drg==
X-Google-Smtp-Source: ABdhPJwZ2e09aAuxZH3N2+SyrsLjEUHyp9pdyK+gS8UP4LQXffH2rQ+cNvPvE/kXryriZPG/7ixnmw==
X-Received: by 2002:a17:902:8b81:b0:158:cedb:3696 with SMTP id
 ay1-20020a1709028b8100b00158cedb3696mr1569707plb.93.1650579545316; 
 Thu, 21 Apr 2022 15:19:05 -0700 (PDT)
Received: from bvanassche-linux.mtv.corp.google.com
 ([2620:15c:211:201:a034:31d8:ca4e:1f35])
 by smtp.gmail.com with ESMTPSA id
 hi21-20020a17090b30d500b001cd4989ff4csm3794876pjb.19.2022.04.21.15.19.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 15:19:04 -0700 (PDT)
From: Bart Van Assche <bvanassche@acm.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Thu, 21 Apr 2022 15:18:16 -0700
Message-Id: <20220421221836.3935616-12-bvanassche@acm.org>
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
 
 Content preview:  Suppress the following compiler warning: segment.c:698:12:
    warning: ‘n’ may be used uninitialized in this function [-Wmaybe-uninitialized]
    698 | if (n < 0) | ^ Signed-off-by: Bart Van Assche <bvanassche@acm.org>
   --- fsck/segment.c | 2 +- 1 file changed, 1 insertion(+), 1 deletion(-) 
 
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
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.214.177 listed in list.dnswl.org]
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.214.177 listed in wl.mailspike.net]
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
  0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
                             EnvelopeFrom freemail headers are
                             different
X-Headers-End: 1nhf8p-0002wC-6w
Subject: [f2fs-dev] [PATCH 11/31] Suppress a compiler warning
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

U3VwcHJlc3MgdGhlIGZvbGxvd2luZyBjb21waWxlciB3YXJuaW5nOgoKc2VnbWVudC5jOjY5ODox
Mjogd2FybmluZzog4oCYbuKAmSBtYXkgYmUgdXNlZCB1bmluaXRpYWxpemVkIGluIHRoaXMgZnVu
Y3Rpb24gWy1XbWF5YmUtdW5pbml0aWFsaXplZF0KICA2OTggfCAgICAgICAgIGlmIChuIDwgMCkK
ICAgICAgfCAgICAgICAgICAgIF4KClNpZ25lZC1vZmYtYnk6IEJhcnQgVmFuIEFzc2NoZSA8YnZh
bmFzc2NoZUBhY20ub3JnPgotLS0KIGZzY2svc2VnbWVudC5jIHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZnNjay9zZWdt
ZW50LmMgYi9mc2NrL3NlZ21lbnQuYwppbmRleCBmZTYzNjE1NDIzZjcuLjI1NGEwZDE0MjVlOSAx
MDA2NDQKLS0tIGEvZnNjay9zZWdtZW50LmMKKysrIGIvZnNjay9zZWdtZW50LmMKQEAgLTU1NSw3
ICs1NTUsNyBAQCBleGl0OgogCiBpbnQgZjJmc19idWlsZF9maWxlKHN0cnVjdCBmMmZzX3NiX2lu
Zm8gKnNiaSwgc3RydWN0IGRlbnRyeSAqZGUpCiB7Ci0JaW50IGZkLCBuOworCWludCBmZCwgbiA9
IC0xOwogCXBnb2ZmX3Qgb2ZmID0gMDsKIAl1OCBidWZmZXJbQkxPQ0tfU1pdOwogCXN0cnVjdCBu
b2RlX2luZm8gbmk7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0
cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlz
dGluZm8vbGludXgtZjJmcy1kZXZlbAo=
