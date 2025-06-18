Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3235CAE1D42
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Jun 2025 16:26:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NzyijMt6cPCpjWmbpp3g0NAI1Gfv8huYj2cg9fmRlaw=; b=hCzrMNyPZQtEjxnKBXqlyrjyRp
	U2qS1OpuK24awdhtAvvbYXyv1TXG1RFMhhxRmhHS/gUHxUx80LZOm1VmpUMo5zaQpBKmTtX0gHEeT
	Zeh9+m8eywPgdySt0AEMOfLFde8DgETLbo7bqoHdDJBD1xEzd5ihq64KDSCkOaAS+46s=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uScgo-00087A-9E;
	Fri, 20 Jun 2025 14:25:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yuanye.ma20@gmail.com>) id 1uScgn-000874-Mc
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Jun 2025 14:25:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mt0UxcsIQbrh7erVicbBBO1vqCNvobmzw4o72dRhMOc=; b=VLo0aH9ijCdmA+9BT7sNuM4nsn
 dQIoRmHMObnH04vftNMdEASUxbWwFTccNBrsULJLMHwAnX23lbVq2iqniF865mbub4ZeS0lY5Dkzw
 FXC1t3jLdqO9wWxq0fEfJ7xc57vFWouXkDi8klJhddRUyBW4EKVjiV1R8u5829w1fSjw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=mt0UxcsIQbrh7erVicbBBO1vqCNvobmzw4o72dRhMOc=; b=R
 IWSCR7GzbaacvHj0/spwaOD117sEi1awA8ish0P9N7frVzHKuobY40L8DVOFU26bWDROu2nzxBbvS
 g/9UCqJOF1uaJNfnAgapaVZ7IaNu/6qho6fT7DY8y+yb7CYfv65Ty8rdNt8LT+9K9PB/BjsMqaGHz
 2c/QBBkRkzFEA+Wc=;
Received: from mail-pl1-f180.google.com ([209.85.214.180])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uScgn-0000fX-CA for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Jun 2025 14:25:57 +0000
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-235e1d710d8so27215775ad.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 20 Jun 2025 07:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750429547; x=1751034347; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mt0UxcsIQbrh7erVicbBBO1vqCNvobmzw4o72dRhMOc=;
 b=EKnN2ycdWtqWGIhjE/N6mqoH1eTBjVcdV+fgHKTZLAdgDtaoHEvwttmGud/VYGSiEq
 BYObxJLF8I6HVpMlNF0vLK8z2/YikmOgOi5gszHdVfxnvgCldzQQuQ/mfNiRaUtPVvCe
 FdDhvkviYWNEAcqIJ9WZgycJ+UQBVX8dX5kOQ+Nb5x7Jajho6CDqxuznNUIAfAyCpWwS
 4rJKFyK/SxB4DJ6ExnZu5sA7q3WadHNw2MP22OTS/ELCgVVqyuHUdpuMUTkdDQ7nngiy
 +0emWTngHjFgNcUsPF5esk5E7oHxZYm03NaEkMxSVRwEAwF1JAdiAdzmaAFL5NZUVC79
 eMvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750429547; x=1751034347;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mt0UxcsIQbrh7erVicbBBO1vqCNvobmzw4o72dRhMOc=;
 b=o1vEy8xUx4f9jllgDUhBrcFO6j8xWlW2q/Rdjjl8D+O+bxnV5BD5l/HqjTUpoK18sx
 MZ8FgWZSOyNg735MJX3TXTBXTPcYr9KpPCRLq7oP6WbN4aoyeu+Jwy9mfMWv3oSnCqEg
 SBUeAcNHXT2q4IIUNI3G19DkP93/ZmHU6rw94h8IB2VqfTdqP8oyBJRd9KTA63ftuVnN
 vxt/m20pZqMxMC2Bh+DUjHScDNCSgqcPZ7cB3uQraPXQL9obhVRD6Ri43WA1cC/8mg7F
 JosuyinQ7+P57eXIX7yXUu6KeTJu1jQ5hclz3i/GLOvMZUeeffWZnvqhTfX0+cQt9ydr
 8Jww==
X-Forwarded-Encrypted: i=1;
 AJvYcCUA+uGDNdmNhp/YrK8ylTdTSZoZ4CpoWWDJ3kicohiwR7/wzKrwHlKdHSi6x8UQELrMXSLdAQj6aKgpeELuErAN@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzNjstZOhsatAGTHqtdv+zbqxK2eiR6aTee5CJshPMep/E32by4
 +lDVdKuYipEoko7S8qaW70pivznV0Xm+MKR6BtrC1Nk8crVBSCxU9aoT
X-Gm-Gg: ASbGncssNRvL09gNhGT3NBdYbWE2hGaV0ClRpNCeEFc2c4X0JTIKxPxW0itwFdwST0o
 f90Ipm8Y4bteg5TmaNtZKsUgc+xxiQsiFPTQv+UObWQcrXGcZlJZ7qe1h0Tmn53DUxYn5tETaZM
 UHXHC6oyJlWJyGM/G8OEjeZVPlk7sybwnxUDqRq/8cHImATlE1Y4fXwSbrPqs0N6Kz1fDAbYDzF
 XTeGzw4iYfomku5oqqoqjkamuwyQrMgJnF03qdakBv+EbZFVESY5WvOrCLYew8zLlkxxFQgCL9q
 QxtvhILE9JZ+xNQ93IVDBjpNC/gD5Fljj6iYNMtHHtohamoFm0jIQ5kinMjRo/TH78d6+x3jliW
 8
X-Google-Smtp-Source: AGHT+IFll20vV4ynGEgWpnSAhVmzio10K+2+NYrQyup3kjW7y/aHFbbZ1VqDies/v11+K5p29Xl8nA==
X-Received: by 2002:a17:903:1c6:b0:235:e9fe:83c0 with SMTP id
 d9443c01a7336-237d9852f68mr45071205ad.27.1750429546517; 
 Fri, 20 Jun 2025 07:25:46 -0700 (PDT)
Received: from localhost.localdomain ([45.8.186.102])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d860aeacsm19272025ad.119.2025.06.20.07.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jun 2025 07:25:46 -0700 (PDT)
From: Yuanye Ma <yuanye.ma20@gmail.com>
To: jaegeuk@kernel.org, chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 19 Jun 2025 06:55:46 +0800
Message-ID: <20250618225546.104949-1-yuanye.ma20@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  This patch fixes two minor typos in Documentation/filesystems/f2fs.rst:
    - "ramdom" → "random" - "reenable" → "re-enable" The changes improve
   spelling and consistency in the documentation. 
 
 Content analysis details:   (0.5 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
                             digit
                             [yuanye.ma20(at)gmail.com]
  0.5 DATE_IN_PAST_24_48     Date: is 24 to 48 hours before Received: date
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail provider
                             [yuanye.ma20(at)gmail.com]
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.214.180 listed in wl.mailspike.net]
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uScgn-0000fX-CA
Subject: [f2fs-dev] [PATCH] docs: f2fs: fix typos in f2fs.rst
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
Cc: Yuanye Ma <yuanye.ma20@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, corbet@lwn.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

VGhpcyBwYXRjaCBmaXhlcyB0d28gbWlub3IgdHlwb3MgaW4gRG9jdW1lbnRhdGlvbi9maWxlc3lz
dGVtcy9mMmZzLnJzdDoKCi0gInJhbWRvbSIg4oaSICJyYW5kb20iCi0gInJlZW5hYmxlIiDihpIg
InJlLWVuYWJsZSIKClRoZSBjaGFuZ2VzIGltcHJvdmUgc3BlbGxpbmcgYW5kIGNvbnNpc3RlbmN5
IGluIHRoZSBkb2N1bWVudGF0aW9uLgoKVGhlc2UgaXNzdWVzIHdlcmUgaWRlbnRpZmllZCB1c2lu
ZyB0aGUgJ2NvZGVzcGVsbCcgdG9vbCB3aXRoIHRoZQpmb2xsb3dpbmcgY29tbWFuZDoKCiAgJCBm
aW5kIERvY3VtZW50YXRpb24vIC1wYXRoIERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zIC1wcnVu
ZSAtbyBcCiAgICAtbmFtZSAnKi5yc3QnIC1wcmludCB8IHhhcmdzIGNvZGVzcGVsbAoKU2lnbmVk
LW9mZi1ieTogWXVhbnllIE1hIDx5dWFueWUubWEyMEBnbWFpbC5jb20+Ci0tLQogRG9jdW1lbnRh
dGlvbi9maWxlc3lzdGVtcy9mMmZzLnJzdCB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Zp
bGVzeXN0ZW1zL2YyZnMucnN0IGIvRG9jdW1lbnRhdGlvbi9maWxlc3lzdGVtcy9mMmZzLnJzdApp
bmRleCA0NDBlNGFlNzRlNDQuLjhlZWI3ZWExNGY2MSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlv
bi9maWxlc3lzdGVtcy9mMmZzLnJzdAorKysgYi9Eb2N1bWVudGF0aW9uL2ZpbGVzeXN0ZW1zL2Yy
ZnMucnN0CkBAIC0yMTgsNyArMjE4LDcgQEAgbW9kZT0lcwkJCSBDb250cm9sIGJsb2NrIGFsbG9j
YXRpb24gbW9kZSB3aGljaCBzdXBwb3J0cyAiYWRhcHRpdmUiCiAJCQkgZnJhZ21lbnRhdGlvbi9h
ZnRlci1HQyBzaXR1YXRpb24gaXRzZWxmLiBUaGUgZGV2ZWxvcGVycyB1c2UgdGhlc2UKIAkJCSBt
b2RlcyB0byB1bmRlcnN0YW5kIGZpbGVzeXN0ZW0gZnJhZ21lbnRhdGlvbi9hZnRlci1HQyBjb25k
aXRpb24gd2VsbCwKIAkJCSBhbmQgZXZlbnR1YWxseSBnZXQgc29tZSBpbnNpZ2h0cyB0byBoYW5k
bGUgdGhlbSBiZXR0ZXIuCi0JCQkgSW4gImZyYWdtZW50OnNlZ21lbnQiLCBmMmZzIGFsbG9jYXRl
cyBhIG5ldyBzZWdtZW50IGluIHJhbWRvbQorCQkJIEluICJmcmFnbWVudDpzZWdtZW50IiwgZjJm
cyBhbGxvY2F0ZXMgYSBuZXcgc2VnbWVudCBpbiByYW5kb20KIAkJCSBwb3NpdGlvbi4gV2l0aCB0
aGlzLCB3ZSBjYW4gc2ltdWxhdGUgdGhlIGFmdGVyLUdDIGNvbmRpdGlvbi4KIAkJCSBJbiAiZnJh
Z21lbnQ6YmxvY2siLCB3ZSBjYW4gc2NhdHRlciBibG9jayBhbGxvY2F0aW9uIHdpdGgKIAkJCSAi
bWF4X2ZyYWdtZW50X2NodW5rIiBhbmQgIm1heF9mcmFnbWVudF9ob2xlIiBzeXNmcyBub2Rlcy4K
QEAgLTI2MSw3ICsyNjEsNyBAQCB0ZXN0X2R1bW15X2VuY3J5cHRpb249JXMKIAkJCSBUaGUgYXJn
dW1lbnQgbWF5IGJlIGVpdGhlciAidjEiIG9yICJ2MiIsIGluIG9yZGVyIHRvCiAJCQkgc2VsZWN0
IHRoZSBjb3JyZXNwb25kaW5nIGZzY3J5cHQgcG9saWN5IHZlcnNpb24uCiBjaGVja3BvaW50PSVz
WzoldVslXV0JIFNldCB0byAiZGlzYWJsZSIgdG8gdHVybiBvZmYgY2hlY2twb2ludGluZy4gU2V0
IHRvICJlbmFibGUiCi0JCQkgdG8gcmVlbmFibGUgY2hlY2twb2ludGluZy4gSXMgZW5hYmxlZCBi
eSBkZWZhdWx0LiBXaGlsZQorCQkJIHRvIHJlLWVuYWJsZSBjaGVja3BvaW50aW5nLiBJcyBlbmFi
bGVkIGJ5IGRlZmF1bHQuIFdoaWxlCiAJCQkgZGlzYWJsZWQsIGFueSB1bm1vdW50aW5nIG9yIHVu
ZXhwZWN0ZWQgc2h1dGRvd25zIHdpbGwgY2F1c2UKIAkJCSB0aGUgZmlsZXN5c3RlbSBjb250ZW50
cyB0byBhcHBlYXIgYXMgdGhleSBkaWQgd2hlbiB0aGUKIAkJCSBmaWxlc3lzdGVtIHdhcyBtb3Vu
dGVkIHdpdGggdGhhdCBvcHRpb24uCi0tIAoyLjQ4LjEKCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QK
TGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
