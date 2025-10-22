Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED95BFE945
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Oct 2025 01:34:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FB3BCs8SJn1jxsKrzaI2PnXY1J4nHE+fkk7dHcAEnXw=; b=EaB2/TA74UBRFmYWGtgCNR6Jmg
	10n6sG5VxZuPdRQEJFumMcIrmc3U3rneAennWCJt+B1eARHNdBDU6W/W39sWZNysO3cSgw42V8XLu
	+oDUfqqt9FK61eISe1hsAXBwQIXa7InUowrqIlbxhLXJ0NcJoqXLMEDTaPQr64sqloUM=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vBiLE-0002eD-As;
	Wed, 22 Oct 2025 23:34:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kartikey406@gmail.com>) id 1vBiLC-0002dz-IC
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Oct 2025 23:34:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1mHGULrbhrQZXqL21jsyCNIXz//QNSU5dqpIYMZ4CNA=; b=lXtZVsyG5Gqzn8sgwbkOAVlwxd
 OMZXbKBjQ7Oi5sJnYyGWofbzgTtoAmHQztkiEz3WwTMpJLanhFswQFATAFHRtgTPrZLf0c9/9BRh6
 O7SkPo9Bkp6qyehYeF6CWTGwS+mqc2xo05Z9iyrOCe7izE7i/t9GlVtTfbv52Bx1RaHw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=1mHGULrbhrQZXqL21jsyCNIXz//QNSU5dqpIYMZ4CNA=; b=j
 vTeJ4+KGlW2uVHkfZZknAhwXXOXoOhSAvbjRe+e3IKl0AoS/D9zDth5hIy5QNvc09CqsEFt5b6gNx
 ygZ5t6Jn+taQMd04vlXyPBWf03IUabAtaRd9MPwtACn7g1Xotqhl0wnTP1Pxk2Fv34Gpnd21/L/tH
 M7TBSnpNbW9pT/hc=;
Received: from mail-pj1-f43.google.com ([209.85.216.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vBiLC-0006EZ-Rl for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Oct 2025 23:34:03 +0000
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-33b9dc8d517so239850a91.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 22 Oct 2025 16:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761176037; x=1761780837; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1mHGULrbhrQZXqL21jsyCNIXz//QNSU5dqpIYMZ4CNA=;
 b=LzioXNnSoAOcdztT+H07kNOHFyptqjmW4NUkQ0Npkz9J4y6nIBAbeSE/E2J521k0DM
 4ci0dutwCoGh5xiPezV4+vmjbvGPAP9/EMrX7laXU082QDHWFz0Xwqvgdbr0it6aZoTS
 5DLQy1zSPM9JXeyvol4sT5nvVe6baAGje5kgZP8shjqeDy8ZJeJzJO2C6XNQsN2mEfPi
 DZzV0NYDwhW5rKcxuaPaVqVMXafyICbuyO0NSAnlBqnp//iZ0eToPx9XyIiyQ2tlNxy8
 hdJPXQns5MnD9G/ncdU7r96d9xoJpMUJeusAgUl5dfLz2zwfqycJsJHbqf6586+Wkp8+
 mSvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761176037; x=1761780837;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1mHGULrbhrQZXqL21jsyCNIXz//QNSU5dqpIYMZ4CNA=;
 b=KKrDubyeqAeVw2m79GrbxWucVCnGPXzPN17LeAedqgoIHxVlEa6bUIf48MSn2renKb
 miSHCV/+ItSxzbg4MqKBZO9TpbQ1GUL/SxJns6+E/yiSg+UPIVcdxNct+qoDV5JGRpFa
 wfINpQx1DJN+246/9KEBQc/lzdZlY+e9r2Bf2XasJu2D/m2oKrXbi2xZxVy7FpGABzEY
 BhA9FL1+EGhYj5j/e/QwQQk7N7yBuA25A1AyxTRcL6R1fkcgpq2sF846Z/aj0qiMattt
 cKdEt8Zrr/LnKcvjzqq9dKYy/6tJU67jT5Q32kGWQc3dHquhO0jiRh5BI4XuwPr6qlTo
 d2Tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtgX51YrSZjG9s+cVbZsdNLBH9tnd8bAeUBL4L840WZZaIvKY0tOlX5uhmzNr8oGNNiWTMbLEM5/kJVQEETQE3@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxhmWJyGBajM95+pMeXaeFFGZjy8bf2tx1e/E14WsgPTXQXKqy6
 vyu4n0Q1xXIj0bwXxyElOrHOSNXMXqu9mUnpxsWWRFLc5bluwwTO6LXxckfQbXL7
X-Gm-Gg: ASbGncsTJz8vg6QGk0/S1x+l3TS9Ea9Sv4LyjRY1Cu5+niQpUr3vRPm544bycdD0J8g
 tMAHsFAc8AxkFV4aPfHO7nijL9aC/Be4+N9a026ICkMCOqbqqRvKT6cvIFQYKffSNh/a8mo0qcM
 ncNAYAqqhsuNdI17vG/5tHgNARB+uw9OQC0pbPduVPhxlq3YvP7SMFIWeNXdyxGhY1EMavpujWY
 uh2VO+NMCvck9KmJaZSaGLRaZOsH8mK0KXP6XKv47xMhrA1Yr21JdhZi4a+yFEwfPeIHqevTkMc
 OU03uWh22AvlbHJo1LofradbGr+bCoukBc1Q8GGV2AlK2KKchNOPIOTtIM8CX/hmX0hQZ8NmRet
 8BCU87ObNsT/RDtzTPNOshot1ge/n5ek04y7JXPqw9uAhty+1IZc9eT0MPKGMR2ldlhZf8MHH/q
 V2ePMO2sGPlliHWtYBTV9h36PDRLSoLKUtLp8=
X-Google-Smtp-Source: AGHT+IEpDb5bUgRrfuih7BhbijCAQcSf9aUmP/xnPQr+15ne4Jw27HzUw1UD5BeHNG7z0+PEo93KNw==
X-Received: by 2002:a17:90b:2412:b0:33e:1ed8:334d with SMTP id
 98e67ed59e1d1-33e1ed835a8mr5313886a91.16.1761176036922; 
 Wed, 22 Oct 2025 16:33:56 -0700 (PDT)
Received: from deepanshu-kernel-hacker..
 ([2405:201:682f:389d:9293:1f1b:ba8e:b77d])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33e2d19d364sm3023608a91.10.2025.10.22.16.33.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 16:33:56 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: jaegeuk@kernel.org, chao@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Date: Thu, 23 Oct 2025 05:03:47 +0530
Message-ID: <20251022233349.102728-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  F2FS can mount filesystems with corrupted directory depth
 values that get runtime-clamped to MAX_DIR_HASH_DEPTH. When RENAME_WHITEOUT
 operations are performed on such directories, f2fs_rename performs [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [kartikey406(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [kartikey406(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.43 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vBiLC-0006EZ-Rl
Subject: [f2fs-dev] [PATCH] f2fs: invalidate dentry cache on failed whiteout
 creation
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
Cc: Deepanshu Kartikey <kartikey406@gmail.com>,
 syzbot+632cf32276a9a564188d@syzkaller.appspotmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RjJGUyBjYW4gbW91bnQgZmlsZXN5c3RlbXMgd2l0aCBjb3JydXB0ZWQgZGlyZWN0b3J5IGRlcHRo
IHZhbHVlcyB0aGF0CmdldCBydW50aW1lLWNsYW1wZWQgdG8gTUFYX0RJUl9IQVNIX0RFUFRILiBX
aGVuIFJFTkFNRV9XSElURU9VVApvcGVyYXRpb25zIGFyZSBwZXJmb3JtZWQgb24gc3VjaCBkaXJl
Y3RvcmllcywgZjJmc19yZW5hbWUgcGVyZm9ybXMKZGlyZWN0b3J5IG1vZGlmaWNhdGlvbnMgKHVw
ZGF0aW5nIHRhcmdldCBlbnRyeSBhbmQgZGVsZXRpbmcgc291cmNlCmVudHJ5KSBiZWZvcmUgYXR0
ZW1wdGluZyB0byBhZGQgdGhlIHdoaXRlb3V0IGVudHJ5IHZpYSBmMmZzX2FkZF9saW5rLgoKSWYg
ZjJmc19hZGRfbGluayBmYWlscyBkdWUgdG8gdGhlIGNvcnJ1cHRlZCBkaXJlY3Rvcnkgc3RydWN0
dXJlLCB0aGUKZnVuY3Rpb24gcmV0dXJucyBhbiBlcnJvciB0byBWRlMsIGJ1dCB0aGUgcGFydGlh
bCBkaXJlY3RvcnkKbW9kaWZpY2F0aW9ucyBoYXZlIGFscmVhZHkgYmVlbiBjb21taXR0ZWQgdG8g
ZGlzay4gVkZTIGFzc3VtZXMgdGhlCmVudGlyZSByZW5hbWUgb3BlcmF0aW9uIGZhaWxlZCBhbmQg
ZG9lcyBub3QgdXBkYXRlIHRoZSBkZW50cnkgY2FjaGUsCmxlYXZpbmcgc3RhbGUgbWFwcGluZ3Mu
CgpUaGlzIGNhdXNlcyBzdWJzZXF1ZW50IG9wZXJhdGlvbnMgdG8gdXNlIGNhY2hlZCBkZW50cnkg
aW5mb3JtYXRpb24gdGhhdApubyBsb25nZXIgbWF0Y2hlcyB0aGUgb24tZGlzayBzdGF0ZS4gV2hl
biBhIHNlY29uZCByZW5hbWUgdGFyZ2V0cyB0aGUKc2FtZSBlbnRyeSwgVkZTIGF0dGVtcHRzIHRv
IGRlY3JlbWVudCBpX25saW5rIG9uIHRoZSBzdGFsZSBpbm9kZSwgd2hpY2gKbWF5IGFscmVhZHkg
aGF2ZSBpX25saW5rPTAsIHRyaWdnZXJpbmcgYSBXQVJOSU5HIGluIGRyb3BfbmxpbmsoKS4KCkV4
YW1wbGUgc2VxdWVuY2U6CjEuIEZpcnN0IHJlbmFtZSAoUkVOQU1FX1dISVRFT1VUKTogZmlsZTIg
4oaSIGZpbGUxCiAgIC0gZjJmcyB1cGRhdGVzIGZpbGUxIGVudHJ5IG9uIGRpc2sgKHBvaW50cyB0
byBpbm9kZSA4KQogICAtIGYyZnMgZGVsZXRlcyBmaWxlMiBlbnRyeSBvbiBkaXNrCiAgIC0gZjJm
c19hZGRfbGluayh3aGl0ZW91dCkgZmFpbHMgKGNvcnJ1cHRlZCBkaXJlY3RvcnkpCiAgIC0gUmV0
dXJucyBlcnJvciB0byBWRlMKICAgLSBWRlMgY2FjaGUgc3RpbGwgaGFzOiBmaWxlMSDihpIgaW5v
ZGUgNyAoc3RhbGUhKQoKMi4gU2Vjb25kIHJlbmFtZTogZmlsZTMg4oaSIGZpbGUxCiAgIC0gVkZT
IHVzZXMgc3RhbGUgY2FjaGU6IGZpbGUxIOKGkiBpbm9kZSA3CiAgIC0gVHJpZXMgdG8gZHJvcF9u
bGluayBvbiBpbm9kZSA3IChpX25saW5rIGFscmVhZHkgMCkKICAgLSBXQVJOSU5HIGluIGRyb3Bf
bmxpbmsoKQoKRml4IHRoaXMgYnkgZXhwbGljaXRseSBpbnZhbGlkYXRpbmcgb2xkX2RlbnRyeSBh
bmQgbmV3X2RlbnRyeSB3aGVuCmYyZnNfYWRkX2xpbmsgZmFpbHMgZHVyaW5nIHdoaXRlb3V0IGNy
ZWF0aW9uLiBUaGlzIGZvcmNlcyBWRlMgdG8KcmVmcmVzaCBmcm9tIGRpc2sgb24gc3Vic2VxdWVu
dCBvcGVyYXRpb25zLCBlbnN1cmluZyBjYWNoZSBjb25zaXN0ZW5jeQpldmVuIHdoZW4gdGhlIHJl
bmFtZSBwYXJ0aWFsbHkgc3VjY2VlZHMuCgpSZXByb2R1Y2VyOgoxLiBNb3VudCBGMkZTIGltYWdl
IHdpdGggY29ycnVwdGVkIGlfY3VycmVudF9kZXB0aAoyLiByZW5hbWVhdDIoZmlsZTIsIGZpbGUx
LCBSRU5BTUVfV0hJVEVPVVQpCjMuIHJlbmFtZWF0MihmaWxlMywgZmlsZTEsIDApCjQuIFN5c3Rl
bSB0cmlnZ2VycyBXQVJOSU5HIGluIGRyb3BfbmxpbmsoKQoKUmVwb3J0ZWQtYnk6IHN5emJvdCs2
MzJjZjMyMjc2YTlhNTY0MTg4ZEBzeXprYWxsZXIuYXBwc3BvdG1haWwuY29tClRlc3RlZC1ieTog
c3l6Ym90KzYzMmNmMzIyNzZhOWE1NjQxODhkQHN5emthbGxlci5hcHBzcG90bWFpbC5jb20KQ2xv
c2VzOiBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS9idWc/ZXh0aWQ9NjMyY2YzMjI3NmE5
YTU2NDE4OGQKU2lnbmVkLW9mZi1ieTogRGVlcGFuc2h1IEthcnRpa2V5IDxrYXJ0aWtleTQwNkBn
bWFpbC5jb20+Ci0tLQogZnMvZjJmcy9uYW1laS5jIHwgNiArKysrLS0KIDEgZmlsZSBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZnMvZjJmcy9u
YW1laS5jIGIvZnMvZjJmcy9uYW1laS5jCmluZGV4IGI4ODI3NzFlNDY5OS4uNzEyNDc5YjdiOTNk
IDEwMDY0NAotLS0gYS9mcy9mMmZzL25hbWVpLmMKKysrIGIvZnMvZjJmcy9uYW1laS5jCkBAIC0x
MDUzLDkgKzEwNTMsMTEgQEAgc3RhdGljIGludCBmMmZzX3JlbmFtZShzdHJ1Y3QgbW50X2lkbWFw
ICppZG1hcCwgc3RydWN0IGlub2RlICpvbGRfZGlyLAogCWlmICh3aGl0ZW91dCkgewogCQlzZXRf
aW5vZGVfZmxhZyh3aGl0ZW91dCwgRklfSU5DX0xJTkspOwogCQllcnIgPSBmMmZzX2FkZF9saW5r
KG9sZF9kZW50cnksIHdoaXRlb3V0KTsKLQkJaWYgKGVycikKKwkJaWYgKGVycikgeworCQkJZF9p
bnZhbGlkYXRlKG9sZF9kZW50cnkpOworCQkJZF9pbnZhbGlkYXRlKG5ld19kZW50cnkpOwogCQkJ
Z290byBwdXRfb3V0X2RpcjsKLQorCQl9CiAJCXNwaW5fbG9jaygmd2hpdGVvdXQtPmlfbG9jayk7
CiAJCXdoaXRlb3V0LT5pX3N0YXRlICY9IH5JX0xJTktBQkxFOwogCQlzcGluX3VubG9jaygmd2hp
dGVvdXQtPmlfbG9jayk7Ci0tIAoyLjQzLjAKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgt
ZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
