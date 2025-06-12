Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 596A0AD707C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Jun 2025 14:32:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V+SC32BhVGsljtenPuPOlo9wCKJXq1cGtUDq4erbOso=; b=NfhyZ8ZSbLWZQLSEVq7a0B0UM2
	MtNzgbTgTY/EuobYbyEmnRfUDItKJkY21UBATFaQZOLj2sthIBesgTL+m6jiuYXmnIVVwRYPvHKHH
	r5Jeo8QK1Bf32G1eQ86oP5nOSJ4SXfd37wYC/+/EOVr5yLrSCJ5lmUL2wFqPXm/jPpMU=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uPh6o-00070g-BS;
	Thu, 12 Jun 2025 12:32:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <rolypolyvg295@gmail.com>) id 1uPh6n-00070T-6T
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Jun 2025 12:32:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:To:Subject:
 Message-ID:Date:From:MIME-Version:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p2cDtcPtp4I8cX6ctOYJP9gzDJlNHz1V9mQxAK05I4I=; b=BghCpldA9imCN6P+REtJkTjL8w
 6XE27TKq9ukveqZ5/VuFcIl1t01UyPpnVE6VOpLSi++Fu0kMjsmWQ1t3KcIf9QpuzGo1EHB3bSzMx
 cY403UDKua9LjdajhjDbyfZscvpDnCBDFwdrNeRQAJXd541vLkPrRANg7lE7Egv1laVc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
 MIME-Version:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=p2cDtcPtp4I8cX6ctOYJP9gzDJlNHz1V9mQxAK05I4I=; b=H
 +L6GXPSqRfT01x/iOYPvQKgFjwDEKU+8xOO2KNM6A6GW5dRLAT4ETknTfg/nth5M91hwvVCQy/mSv
 ROmROGpRoWKn8lTHSlgTA+k8JD/JzrFY3+XipNKNZ8yhBS1n1AtJZQHaJP1/2r89gCQD0A7K8oE2Z
 jgHvRz0T/UC6qPvY=;
Received: from mail-pj1-f45.google.com ([209.85.216.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uPh6m-0005ka-SD for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Jun 2025 12:32:41 +0000
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-3139027b825so690529a91.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 12 Jun 2025 05:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749731550; x=1750336350; darn=lists.sourceforge.net;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=p2cDtcPtp4I8cX6ctOYJP9gzDJlNHz1V9mQxAK05I4I=;
 b=O8bfW5GB37pPZCDbik18RYLaT9L4v2G0pjzHYP3BIamqhswPPTLixO3oJuWpyB070T
 Hg0OvzWHN5WR92NElcppKZp/hK6QjAzQCWK3z0RSv94nZXjf7mKkawO6jyT2XAXIvz+7
 cw15d3w+9ivsINiXb7YSaJdPhLTTyOfvaegvz7cSb9HSfMigqusIK+mlnOfeVDdCAPZd
 cNLuBKRSHMryqNw0/M0jchB4iSrAc4MXc5H+SxS/ND+tGg7XKvWj7NELWdDoJY8UK8aX
 CDWHNBNStYJydkNwbGjBi2bb4tJzHxyO755NOcV71b5oaJa+4hwzsVzZ8kWil7ElnceZ
 KlNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749731550; x=1750336350;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p2cDtcPtp4I8cX6ctOYJP9gzDJlNHz1V9mQxAK05I4I=;
 b=j4gzwOeTxaF/zIk8whxh6pZSZkS+nkyLmD0Ka9ExmO7AfUTxZhmikZDzf3nyBP78BO
 mrZ0p40T88Es0VOQ1DC4ADees+GRP9UymDrZOaoujBQeqaG50zDdEWM3TxGuIhc7/8MQ
 IRcfetpemkGgJ4ZrWqRPFLDtCmr13YVREjGyd38oOoW5ehrzOzQTMZB49W4djgWtdLUV
 JP+2HX61qRcA8Zeiv1Hdxxyb5tu/PopUCgFigDod2jdF0C1Fsy4uQZhuaI01QoI4R/kX
 cWR051j/SM42Qooe7XgWsOH/o/hIc1L7jQF+xIHZ+oolfiosQ6I/GCLuNgSNRR7veu6v
 vB/A==
X-Gm-Message-State: AOJu0YzGmMzCCyWl00zaBWirmw4YSHkl+F7AK//zso1ozp58EpXUA3k+
 wXc69gr9/c3hbDpbCvXObHzP2ydbfe2yajE/K4OaiSlRuOedQfEecPt8PYyk8H7cWAm3QN6hYLX
 Gf7FB8+0CmCr4dk4+l6vjnLRiKBByi6BcM6jy
X-Gm-Gg: ASbGncuYVkXzcjfx0pio3muVwtMrIRCCoG6Gxtf+6pzEqKK6l24MLzA2RF9m36t6SOC
 gp/r4CBR1S1N4GaY5z8a46nz144WK8IcsSmAQkTGsRTF0UpEuPqweys2gD2NEbi9lByA1v2bhp1
 cCFas1p3ZdSCaWBbu7Nbf680APLioqAvUqPTfs4dueLQ==
X-Google-Smtp-Source: AGHT+IE88JXdO8YIGMg91fKy0AtTkGFadblN7Hk9SNH8mTvTDVHtY39T6C44y3KMU+VfYiVtXU010sc+X+s2NNy3hhs=
X-Received: by 2002:a17:90a:e705:b0:313:283e:e881 with SMTP id
 98e67ed59e1d1-313bfbb3b91mr5427070a91.11.1749731549867; Thu, 12 Jun 2025
 05:32:29 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?6rmA6rec7KeE?= <rolypolyvg295@gmail.com>
Date: Thu, 12 Jun 2025 21:32:17 +0900
X-Gm-Features: AX0GCFutfkbKawkLhK5Mid0_-TIbJQfrEeUOAztKLqYQz6Es2Uw7TgHXRSwNfYg
Message-ID: <CAA_oFbL+kxddwhS9-PWeO1EE4yJBHk6uwMwjB+r9wAW6+Zb45Q@mail.gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi F2FS developers, I'm testing multi-threaded direct I/O
 in LFS mode on Linux kernel 6.8.0-57.59,
 and noticed what seems to be an inefficiency
 in block allocation behavior inside `fs/f2fs/data.c` (specifically `f2fs_map
 [...] Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [209.85.216.45 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.45 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [rolypolyvg295(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [rolypolyvg295(at)gmail.com]
X-Headers-End: 1uPh6m-0005ka-SD
Subject: [f2fs-dev] [question] Design rationale behind f2fs_map_blocks block
 reuse in LFS mode with DIO
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgRjJGUyBkZXZlbG9wZXJzLAoKSSdtIHRlc3RpbmcgbXVsdGktdGhyZWFkZWQgZGlyZWN0IEkv
TyBpbiBMRlMgbW9kZSBvbiBMaW51eCBrZXJuZWwKNi44LjAtNTcuNTksIGFuZCBub3RpY2VkIHdo
YXQgc2VlbXMgdG8gYmUgYW4gaW5lZmZpY2llbmN5IGluIGJsb2NrCmFsbG9jYXRpb24gYmVoYXZp
b3IgaW5zaWRlIGBmcy9mMmZzL2RhdGEuY2AgKHNwZWNpZmljYWxseQpgZjJmc19tYXBfYmxvY2tz
KClgKToKCjEuIEluIExGUyBtb2RlIHdpdGggZGlyZWN0IEkvTywgYGYyZnNfbWFwX2Jsb2Nrcygp
YCBhbHdheXMgY2FsbHMKYF9fYWxsb2NhdGVfZGF0YV9ibG9jaygpYCB0byByZXNlcnZlIGEgbmV3
IGJsb2NrIGFuZCB1cGRhdGVzIHRoZQpub2RlL05BVCBlbnRyeSwgcmVnYXJkbGVzcyBvZiBleHRl
bnQgY29udGludWl0eS4KCjIuIElmIHRoZSBuZXcgYmxvY2sgaXMgbm90IHBoeXNpY2FsbHkgY29u
dGlndW91cyB3aXRoIHRoZSBjdXJyZW50CmV4dGVudCwgaXQgc3VibWl0cyB0aGUgY3VycmVudCBi
aW8gYW5kIGRlZmVycyB0aGUgd3JpdGUgb2YgdGhlIG5ld2x5CnJlc2VydmVkIGJsb2NrICh3aGlj
aCBpcyBub3cgcmVjb3JkZWQgaW4gdGhlIG5vZGUpIHRvIHRoZSBuZXh0Cm1hcHBpbmcuCgozLiBP
biB0aGUgbmV4dCBgZjJmc19tYXBfYmxvY2tzKClgIGNhbGwsIGl0IGZpbmRzIHRoYXQgdGhlIGxv
Z2ljYWwKYmxvY2sgaXMgYWxyZWFkeSBtYXBwZWQgaW4gdGhlIG5vZGUvTkFUIGVudHJ5IGFuZCBz
a2lwcyBvdmVyCml04oCUZGVzcGl0ZSB0aGUgYmxvY2sgbmV2ZXIgaGF2aW5nIGJlZW4gd3JpdHRl
buKAlHJlc3VsdGluZyBpbiBhbGxvY2F0aW9uCm9mIHlldCBhbm90aGVyIGJsb2NrLiBPdmVyIHRp
bWUsIHRoaXMgbGVhdmVzIGJlaGluZCBob2xlcyBpbiB0aGUKY3VycmVudCBzZWdtZW50LCBlc3Bl
Y2lhbGx5IHVuZGVyIGhlYXZ5IG11bHRpLXRocmVhZGVkIERJTy4KCgpTaW5jZSBJJ20gc3RpbGwg
bmV3IHRvIEYyRlMgaW50ZXJuYWxzLCBJIG1heSBiZSBtaXNzaW5nIHNvbWV0aGluZyDigJQKSSdk
IGxpa2UgdG8gdW5kZXJzdGFuZCB0aGUgZGVzaWduIHJhdGlvbmFsZSBiZWhpbmQgdGhpcyBiZWhh
dmlvciBpbgpMRlMgbW9kZSwgaWYgcG9zc2libGUuCgoqKk15IHF1ZXN0aW9ucyBhcmU6KioKCi0g
SXMgdGhlcmUgYSBzcGVjaWZpYyByZWFzb24gRjJGUyBkb2VzIG5vdCBkaXN0aW5ndWlzaCBiZXR3
ZWVuCnJlc2VydmVkLWJ1dC11bndyaXR0ZW4gYW5kIGFscmVhZHktd3JpdHRlbiBibG9ja3MgaW4g
dGhpcyBjYXNlPwotIFdvdWxkIGl0IGJlIHBvc3NpYmxlIChvciBiZW5lZmljaWFsKSB0bzoKCiAg
MS4gRGVsYXkgYmxvY2sgYWxsb2NhdGlvbiB1bnRpbCB0aGUgZXh0ZW50IGNhbiBhY3R1YWxseSBi
ZSBleHRlbmRlZD8KCiAgMi4gVHJhY2sgInJlc2VydmVkLWJ1dC11bndyaXR0ZW4iIGJsb2NrcyBk
aXN0aW5jdGx5IHRvIGF2b2lkIHJlYWxsb2NhdGlvbj8KCgpUaGFua3MgaW4gYWR2YW5jZSBmb3Ig
YW55IGNsYXJpZmljYXRpb24gb3IgaW5zaWdodC4KCkJlc3QgcmVnYXJkcywKCkd5amluIEtpbQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYy
ZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2Uu
bmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYy
ZnMtZGV2ZWwK
