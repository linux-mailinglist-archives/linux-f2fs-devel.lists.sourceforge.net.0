Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F87AA9AFBC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Apr 2025 15:51:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u7wzS-0000cC-GD;
	Thu, 24 Apr 2025 13:51:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sandeen@redhat.com>) id 1u7wzR-0000c4-C8
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Apr 2025 13:51:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F850X9Wvb7zvNpfszgH9NKoEboiy7g5mNWn6Fyxim2o=; b=QC06QMcAh2Z/KuKb3auIFErP5u
 ZBUWq5Q6BAvLh1TGNe286DHhBko9zsRjmi7xBfqIvgobuYkQVX5zKLJ5Rg1uxZLvnSjN4vfBGfOUX
 AJCe66aWZpJwrKoCK+86YaRw0c8oYilepXCkhR7ybO5TXpS6ZWsf2/QurS+TfX09zqo4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=F850X9Wvb7zvNpfszgH9NKoEboiy7g5mNWn6Fyxim2o=; b=G
 4ZMhPm5vcdhkRaOU5NJmXsFFDkcvyyvlBNlREsxPuX6oFX9IUolkD5VfL2TJgzjQp/1+N5iRMjJe9
 4oW0oXBydww2NgFGFTiV75CyMRU42USE19wV2wEKFRd1JkEWlnV+awCkd+/cJp/zS/k09/6G3Yr8G
 zizU5O9/REguVCP0=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1u7wzB-0000nS-0M for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Apr 2025 13:51:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745502668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=F850X9Wvb7zvNpfszgH9NKoEboiy7g5mNWn6Fyxim2o=;
 b=XVUo/GXLQO1xvocPd9kYNq60L8bCmU6+Gmd5g8/Awk2lrowmoqDR6W9sYiH8gvF8Q2ANFB
 qZhlN4IGaVwyjz9YOL9kn89hDiM0ktJvN5+v8/oC8KaUOHEuEhsqPDRBkEsySTLVt2eyQa
 Qd3zQlWDfyOLZQHI3WxO9ZZ0E+etQzY=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-446-t-FlPdpgOjOMZB15D949uw-1; Thu, 24 Apr 2025 09:51:07 -0400
X-MC-Unique: t-FlPdpgOjOMZB15D949uw-1
X-Mimecast-MFC-AGG-ID: t-FlPdpgOjOMZB15D949uw_1745502666
Received: by mail-ot1-f70.google.com with SMTP id
 46e09a7af769-72c0d69b71aso393383a34.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 24 Apr 2025 06:51:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745502666; x=1746107466;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F850X9Wvb7zvNpfszgH9NKoEboiy7g5mNWn6Fyxim2o=;
 b=C97wuxef2tEgeZJXxxA3UoTsUrf7mj+pnrEAUElseObXH2arjkBXlPkFBsK+N4wvo/
 uVoGX9EQZhra6JZ1/qpolVu1cB+gwrcSaQ+WI0Y5Pd2jAo8q5cLaL+6vJMiVSFsVxEYN
 Kdgrlr6JRRzUxAO1oqbnxbx7Y0A9NCTGWAtomHJVFo8awk/gHiu6CLMDWVcLHgl2qC2Y
 dGgyeUdEUbpgZAc0qXtdEQLxp2qWfwKx5c+AblTmDHS0R1rygXamI8d1J8Fv5Fm6/7qo
 Vv+SWlniXTqNm28nhfSs5n9sQ7+//T36roTcxdRviIznt1Bu0oqwC09mIfgxkD9MHIVz
 ppng==
X-Gm-Message-State: AOJu0YxelE3fOeZFRQ95aI0EXh1tRwY8jCYbfC9pvxA9RhJ2ezepSVZy
 GN2jumvc09D1b/qaH0matIGYCz1Yqfik/YiE/V5uWENSh0T2tLDTPC/d1EpU6f6GIo+lBZw0tSD
 AV3Er9FbuRkqd9QyMhnVXvRDb/bovkb0SyCgAqfcWoZTqs2lG1euZINI2Yj4PO+kM0OYMhADHLS
 Fq3Z2K2eAcjjapkbrNAAZTRUh09qkN5ZPBZSZyUOCvZKUU00nbxg8Id1EmHfAB
X-Gm-Gg: ASbGncunqU0ZuMR5/u4zOpbNGkztyCt5g2Y5PBwCYrqhlPOUeq1dXJrNuXA2mBbLssT
 qgV+FP3kvcy93iwmmz8akTUkIy4Kev0TcQmTtxPtUrp4wQdpC2ZmkEJ3eCD21nXpoaRn+o64Pi+
 LfCXllB6LLylFBR9Dk7kdE/Yv2jyyz5VHF1ObJAK6WX7ysKJwVP7umHyX4BV65T1DtcUJzSTqg1
 Ry69sSg35GZiW+PGkHkEnc6dCcFESu9HgSdOfEUCs5zaOH/nGxM8I01zjjM2BiaZ+DL5NH7qNZF
 ZKzLm+QupSVqAJ+0JB0fqTpxgiusJfm8zv6G5jAZZ6Y81TvjN6VtNds=
X-Received: by 2002:a05:6830:6283:b0:72b:9b1f:2e1d with SMTP id
 46e09a7af769-7304da4e008mr1777147a34.2.1745502666180; 
 Thu, 24 Apr 2025 06:51:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOIadjNwkxxxrid67bBL9suXr9I5Y503+xGT837WbXF/k+0bW2wrNC0aPEhwyZfHn+pmx4GQ==
X-Received: by 2002:a05:6830:6283:b0:72b:9b1f:2e1d with SMTP id
 46e09a7af769-7304da4e008mr1777125a34.2.1745502665796; 
 Thu, 24 Apr 2025 06:51:05 -0700 (PDT)
Received: from localhost.localdomain (nwtn-09-2828.dsl.iowatelecom.net.
 [67.224.43.12]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7304f37b158sm233595a34.49.2025.04.24.06.51.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 06:51:05 -0700 (PDT)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 23 Apr 2025 12:08:44 -0500
Message-ID: <20250423170926.76007-1-sandeen@redhat.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YfIYPBgd_dWo7HWw_ZCfIELLpqpJyDZF0nFLekozJoE_1745502666
X-Mimecast-Originator: redhat.com
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: V3: - Rebase onto
 git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 dev branch - Fix up some 0day robot warnings This is a forward-port of
 Hongbo's original f2fs mount API conversion,
 posted last August at
 https://lore.kernel.org/linux-f2fs-devel/20240814023912.3959299-1-lihongbo22@huawei.com/
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.133.124 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.133.124 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.133.124 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.133.124 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.8 DATE_IN_PAST_12_24     Date: is 12 to 24 hours before Received: date
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.8 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u7wzB-0000nS-0M
Subject: [f2fs-dev] [PATCH V3 0/7] f2fs: new mount API conversion
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
From: Eric Sandeen via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Sandeen <sandeen@redhat.com>
Cc: linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, lihongbo22@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

VjM6Ci0gUmViYXNlIG9udG8gZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJu
ZWwvZ2l0L2phZWdldWsvZjJmcy5naXQKICBkZXYgYnJhbmNoCi0gRml4IHVwIHNvbWUgMGRheSBy
b2JvdCB3YXJuaW5ncwoKVGhpcyBpcyBhIGZvcndhcmQtcG9ydCBvZiBIb25nYm8ncyBvcmlnaW5h
bCBmMmZzIG1vdW50IEFQSSBjb252ZXJzaW9uLApwb3N0ZWQgbGFzdCBBdWd1c3QgYXQgCmh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWYyZnMtZGV2ZWwvMjAyNDA4MTQwMjM5MTIuMzk1OTI5
OS0xLWxpaG9uZ2JvMjJAaHVhd2VpLmNvbS8KCkkgaGFkIGJlZW4gdHJ5aW5nIHRvIGFwcHJvYWNo
IHRoaXMgd2l0aCBhIGxpdHRsZSBsZXNzIGNvbXBsZXhpdHksCmJ1dCBpbiB0aGUgZW5kIEkgcmVh
bGl6ZWQgdGhhdCBIb25nYm8ncyBhcHByb2FjaCAod2hpY2ggZm9sbG93cwp0aGUgZXh0NCBhcHBy
b2FjaCkgd2FzIGEgZ29vZCBvbmUsIGFuZCBJIHdhcyBub3QgbWFraW5nIGFueSBwcm9ncnNzCm15
c2VsZi4g8J+YiQoKSW4gYWRkaXRpb24gdG8gdGhlIGZvcndhcmQtcG9ydCwgSSBoYXZlIGFsc28g
Zml4ZWQgYSBjb3VwbGUgYnVncyBJIGZvdW5kCmR1cmluZyB0ZXN0aW5nLCBhbmQgc29tZSBpbXBy
b3ZlbWVudHMgLyBzdHlsZSBjaG9pY2VzIGFzIHdlbGwuIEhvbmdibyBhbmQKSSBoYXZlIGRpc2N1
c3NlZCBtb3N0IG9mIHRoaXMgb2ZmLWxpc3QgYWxyZWFkeSwgc28gSSdtIHByZXNlbnRpbmcgdGhl
Cm5ldCByZXN1bHQgaGVyZS4KClRoaXMgZG9lcyBwYXNzIG15IHR5cGljYWwgdGVzdGluZyB3aGlj
aCBkb2VzIGEgbGFyZ2UgbnVtYmVyIG9mIHJhbmRvbQptb3VudHMvcmVtb3VudHMgd2l0aCB2YWxp
ZCBhbmQgaW52YWxpZCBvcHRpb24gc2V0cywgb24gZjJmcyBmaWxlc3lzdGVtCmltYWdlcyB3aXRo
IHZhcmlvdXMgZmVhdHVyZXMgaW4gdGhlIG9uLWRpc2sgc3VwZXJibG9jay4gKEkgd2FzIG5vdCBh
YmxlCnRvIHRlc3QgYWxsIG9mIHRoaXMgY29tcGxldGVseSwgYXMgc29tZSBvcHRpb25zIG9yIGZl
YXR1cmVzIHJlcXVpcmUKaGFyZHdhcmUgSSBkbid0IGhhdmUuKQoKVGhhbmtzLAotRXJpYwoKKEEg
cmVjYXAgb2YgSG9uZ2JvJ3Mgb3JpZ2luYWwgY292ZXIgbGV0dGVyIGlzIGJlbG93LCBlZGl0ZWQg
c2xpZ2h0bHkgZm9yCnRoaXMgc2VyaWVzOikKClNpbmNlIG1hbnkgZmlsZXN5c3RlbXMgaGF2ZSBk
b25lIHRoZSBuZXcgbW91bnQgQVBJIGNvbnZlcnNpb24sCndlIGludHJvZHVjZSB0aGUgbmV3IG1v
dW50IEFQSSBjb252ZXJzaW9uIGluIGYyZnMuCgpUaGUgc2VyaWVzIGNhbiBiZSBhcHBsaWVkIG9u
IHRvcCBvZiB0aGUgY3VycmVudCBtYWlubGluZSB0cmVlCmFuZCB0aGUgd29yayBpcyBiYXNlZCBv
biB0aGUgcGF0Y2hlcyBmcm9tIEx1a2FzIEN6ZXJuZXIgKGhhcwpkb25lIHRoaXMgaW4gZXh0NFsx
XSkuIEhpcyBwYXRjaCBnaXZlIG1lIGEgbG90IG9mIGlkZWFzLgoKSGVyZSBpcyBhIGhpZ2ggbGV2
ZWwgZGVzY3JpcHRpb24gb2YgdGhlIHBhdGNoc2V0OgoKMS4gUHJlcGFyZSB0aGUgZjJmcyBtb3Vu
dCBwYXJhbWV0ZXJzIHJlcXVpcmVkIGJ5IHRoZSBuZXcgbW91bnQKQVBJIGFuZCB1c2UgaXQgZm9y
IHBhcnNpbmcsIHdoaWxlIHN0aWxsIHVzaW5nIHRoZSBvbGQgQVBJIHRvCmdldCBtb3VudCBvcHRp
b25zIHN0cmluZy4gU3BsaXQgdGhlIHBhcmFtZXRlciBwYXJzaW5nIGFuZAp2YWxpZGF0aW9uIG9m
IHRoZSBwYXJzZV9vcHRpb25zIGhlbHBlciBpbnRvIHR3byBzZXBhcmF0ZQpoZWxwZXJzLgoKICBm
MmZzOiBBZGQgZnMgcGFyYW1ldGVyIHNwZWNpZmljYXRpb25zIGZvciBtb3VudCBvcHRpb25zCiAg
ZjJmczogbW92ZSB0aGUgb3B0aW9uIHBhcnNlciBpbnRvIGhhbmRsZV9tb3VudF9vcHQKCjIuIFJl
bW92ZSB0aGUgdXNlIG9mIHNiL3NiaSBzdHJ1Y3R1cmUgb2YgZjJmcyBmcm9tIGFsbCB0aGUKcGFy
c2luZyBjb2RlLCBiZWNhdXNlIHdpdGggdGhlIG5ldyBtb3VudCBBUEkgdGhlIHBhcnNpbmcgaXMK
Z29pbmcgdG8gYmUgZG9uZSBiZWZvcmUgd2UgZXZlbiBnZXQgdGhlIHN1cGVyIGJsb2NrLiBJbiB0
aGlzCnBhcnQsIHdlIGludHJvZHVjZSBmMmZzX2ZzX2NvbnRleHQgdG8gaG9sZCB0aGUgdGVtcG9y
YXJ5Cm9wdGlvbnMgd2hlbiBwYXJzaW5nLiBGb3IgdGhlIHNpbXBsZSBvcHRpb25zIGNoZWNrLCBp
dCBoYXMKdG8gYmUgZG9uZSBkdXJpbmcgcGFyc2luZyBieSB1c2luZyBmMmZzX2ZzX2NvbnRleHQg
c3RydWN0dXJlLgpGb3IgdGhlIGNoZWNrIHdoaWNoIG5lZWRzIHNiL3NiaSwgd2UgZG8gdGhpcyBk
dXJpbmcgc3VwZXIKYmxvY2sgZmlsbGluZy4KCiAgZjJmczogQWxsb3cgc2JpIHRvIGJlIE5VTEwg
aW4gZjJmc19wcmludGsKICBmMmZzOiBBZGQgZjJmc19mc19jb250ZXh0IHRvIHJlY29yZCB0aGUg
bW91bnQgb3B0aW9ucwogIGYyZnM6IHNlcGFyYXRlIHRoZSBvcHRpb25zIHBhcnNpbmcgYW5kIG9w
dGlvbnMgY2hlY2tpbmcKCjMuIFN3aXRjaCB0aGUgZjJmcyB0byB1c2UgdGhlIG5ldyBtb3VudCBB
UEkgZm9yIG1vdW50IGFuZApyZW1vdW50LgoKICBmMmZzOiBpbnRyb2R1Y2UgZnNfY29udGV4dF9v
cGVyYXRpb24gc3RydWN0dXJlCiAgZjJmczogc3dpdGNoIHRvIHRoZSBuZXcgbW91bnQgYXBpCgpb
MV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjExMDIxMTE0NTA4LjIxNDA3LTEtbGN6
ZXJuZXJAcmVkaGF0LmNvbS8KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZl
bEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlz
dHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
