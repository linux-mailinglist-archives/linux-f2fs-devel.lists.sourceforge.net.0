Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Oy9HKPN1yGmsmQUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 29 Mar 2026 01:44:35 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B15EB3505F0
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 29 Mar 2026 01:44:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Date:Message-Id:Mime-Version:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3mLKpcTO2rUpw3HaDevK/q0c9W8Y2/LQAXUgDMN3gs0=; b=JGHG5NKEyECLDotR33ScgAywB6
	yWbI45jKwKtC8f45uuhXAAVzw6s4WaFQpINfae277PQ/s1QgLta9MxtV6GafwvvFg66HDSu/6Eb0Q
	oltle/T/5xMCq3yg7HoTE5zT9uxzJXKG8vNl7MOI1QdN8E7mzh9WrvFGB5HvgV1K6iF0=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w6eGP-0008Ry-JZ;
	Sun, 29 Mar 2026 00:44:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shuangpeng.kernel@gmail.com>) id 1w6eGO-0008Rs-5M
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 29 Mar 2026 00:44:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Cc:Date:Message-Id:Subject:Mime-Version:
 Content-Transfer-Encoding:Content-Type:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iqMfJl5/lFa18VNuT8wPzE4o/GJyLPfe5qGT4pUdcno=; b=cBhtArp7kSbDIiDKocuv+l9xnd
 4bYHhxcIowyVQvSuGTBWdljDp3T3yupWdMMnGvXhNqhcvFxhMDMlA18yXVSS7NPY/+Ohn1ML4yERH
 bE3pPrOCy4SMIJyBu3ujs4lUcHgk9NxFnHYUGhMbL14FPbNnr5h9L0VpjqbXR0njHiAo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Cc:Date:Message-Id:Subject:Mime-Version:Content-Transfer-Encoding:
 Content-Type:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=iqMfJl5/lFa18VNuT8wPzE4o/GJyLPfe5qGT4pUdcno=; b=H
 LVLZbnN8ANaqFdhGAeQDG5fGWtXH8Hpo83SQSesSwCG/3jjm+mDyIXT8OU+6q4b8t8s3PUCgFF3d2
 P97Z9gpQ4hkE4JWHE1g2RA7GRbdoOu2N4p0InVaUmUlIz6TYOvw2Mt7e7nTGCWIOZQdZkYVvgwxr3
 coSQzi/dpe4agXX4=;
Received: from mail-qt1-f180.google.com ([209.85.160.180])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1w6eGN-0008Rh-N3 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 29 Mar 2026 00:44:24 +0000
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-50912a097b0so19441321cf.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 28 Mar 2026 17:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774745058; x=1775349858; darn=lists.sourceforge.net;
 h=to:cc:date:message-id:subject:mime-version
 :content-transfer-encoding:from:from:to:cc:subject:date:message-id
 :reply-to; bh=iqMfJl5/lFa18VNuT8wPzE4o/GJyLPfe5qGT4pUdcno=;
 b=A5eZOa9TiR27sV/aqA1+Z3rljSmcqkZeB1CLCkrVD75P0SyPIS+HC8gipdm3XywVHp
 B7C/pxtvgs83HORZUq9RfXx5uAGgAiyCOF0ofFOpy1edRskB/pa2OfqeRGMOg6wUfT1n
 3M/wGRvwy3oQTHrVK/+ecdZv1xCs8/kLkPwXSXOBeFr4QOplRlixMxYlZlb2KpkjMle3
 7lxn39xgx5RdbaiJRNSD9in/IrcsCBG8zRR2sjijpIZGo70lXZErWzslXD6rolahXHrL
 sYCY8b78ILZfvRwTluufAKS8p3uLL9ybYaDrRdjn2F6EgfxT4ruWTf5Xke4G9gLrWfSg
 tjfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774745058; x=1775349858;
 h=to:cc:date:message-id:subject:mime-version
 :content-transfer-encoding:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=iqMfJl5/lFa18VNuT8wPzE4o/GJyLPfe5qGT4pUdcno=;
 b=EqFyvHUndQvKqVCYlzkaHvDy0OB79T9KwVh7+BAYCwnYLYRKOTse7bs8gWA0K2YsAB
 xHZYk8OC+a7UHqiZ34rI5pASTv11h3c+CQ+mJepHTwAPrp1c2XPVFK40YpDio4m/MfE7
 QIoyatuqgw+SiJvE0KIA2wxY8bQNCltr86yZ8WRXsDeHC54foZmLjJGLkZhZfTwtEHqT
 rCdMF8xUjWd4NrLVXzw5w/79RIHpysoo6HQ1FRt3Az857caN3uHFZ2wftIiPQamEAdvn
 zwLRXFzHqFwf0mzbiM08TV4e9SdPY7dEvD1LaYBcrxN59Xk5kgvBSEgdT/Af41FE+9IU
 tUjg==
X-Gm-Message-State: AOJu0YwXJgwMW2U442HTH22QFDMYzRTUghjP8JB7qRPHhY7Ea4tzKNfy
 nF0q3+GXcJqfiX6gVBHiL37cf3M0jmEhxYim8RZxghizfZXiY3o6uvBg
X-Gm-Gg: ATEYQzx/Oh/Ff+kEjVEgGNOEZUGvbAE3HkIWtP5EjSUMsKANgbM3j6XeJ8Kygt+r8aa
 TGCXrHHChtvHx1nq7foT8a1RGvMFp2BbMnEwJqIf6033CMSjVM50/6lo7PKGbcWP1HFWrJcmTrq
 Vkskg00JDkmhDbz+bnM2mjmxmrVdbpQSb7fM95giwdm+aLZ9so6ZFiI3+PSyk1OCJDAizeTx8bb
 k2yZ24WSrSCbab9P6LZrRDFQfe9otkU9o2txmLnA1b+PuDLxvqPXm1Iqz9/+xewC5Nr2dc9MKmj
 d+qH3nWaH0WA/7fL+32pAnZmiS3njlVvqJemo6cwsxTQCOppzwE8NKA7PtU+Rm7KJHPmAqoNzh4
 YsuriTCDsvojF5/gPDzx8AUNNqN+UOPgCihBRplceMNq9MGyxh9f+j8ejEWCBLkfovekfUEaJCi
 AgkdP6mA/2WEbFJnyT6zfFWe2eg9y6t80Ay+SezSWHRXLO2tPbiaaeSHi0tSEbUug=
X-Received: by 2002:a05:622a:4d9b:b0:50b:277d:efc9 with SMTP id
 d75a77b69052e-50ba3918d47mr106097711cf.39.1774745057674; 
 Sat, 28 Mar 2026 17:44:17 -0700 (PDT)
Received: from smtpclient.apple ([2601:985:4601:5df0:d133:2d56:2e26:76e])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-50bb2c678cfsm29034361cf.2.2026.03.28.17.44.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 28 Mar 2026 17:44:17 -0700 (PDT)
From: Shuangpeng <shuangpeng.kernel@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.400.21\))
Message-Id: <68D594A5-3A3B-41B5-BEEF-1D0CD08D4A18@gmail.com>
Date: Sat, 28 Mar 2026 20:44:05 -0400
To: chao@kernel.org,
 jaegeuk@kernel.org,
 ebiggers@kernel.org
X-Mailer: Apple Mail (2.3864.400.21)
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Kernel Maintainers, I hit the following KASAN report while
 testing current upstream kernel: KASAN: null-ptr-deref in
 fscrypt_decrypt_pagecache_blocks
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [shuangpeng.kernel(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.180 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1w6eGN-0008Rh-N3
Subject: [f2fs-dev] [BUG] f2fs/fscrypt: KASAN: null-ptr-deref in
 fscrypt_decrypt_pagecache_blocks
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
Cc: linux-fscrypt@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-0.91 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:ebiggers@kernel.org,m:linux-fscrypt@vger.kernel.org,m:tytso@mit.edu,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[shuangpengkernel@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shuangpengkernel@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	NEURAL_HAM(-0.00)[-0.995];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	APPLE_MAILER_COMMON(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: B15EB3505F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgS2VybmVsIE1haW50YWluZXJzLAoKSSBoaXQgdGhlIGZvbGxvd2luZyBLQVNBTiByZXBvcnQg
d2hpbGUgdGVzdGluZyBjdXJyZW50IHVwc3RyZWFtIGtlcm5lbDoKCktBU0FOOiBudWxsLXB0ci1k
ZXJlZiBpbiBmc2NyeXB0X2RlY3J5cHRfcGFnZWNhY2hlX2Jsb2NrcwoKb24gY29tbWl0OiBiYmVi
ODNkMzE4MmFiZTBkMjQ1MzE4ZTI3NGU4NTMxZTVkZDdhOTQ4IChNYXIgMjQgMjAyNikKClRoZSBy
ZXByb2R1Y2VyIGFuZCAuY29uZmlnIGZpbGVzIGFyZSBoZXJlLgpodHRwczovL2dpc3QuZ2l0aHVi
LmNvbS9zaHVhbmdwZW5nYmFpLzRiYjVkOTFkYjU0ZWUyYzY1NGIwY2ExZjFkMmE5YjQ3CgpJ4oCZ
bSBoYXBweSB0byB0ZXN0IGRlYnVnIHBhdGNoZXMgb3IgcHJvdmlkZSBhZGRpdGlvbmFsIGluZm9y
bWF0aW9uLgoKUmVwb3J0ZWQtYnk6IFNodWFuZ3BlbmcgQmFpIDxzaHVhbmdwZW5nLmtlcm5lbEBn
bWFpbC5jb20+CgoKWyAgIDg1LjY1MzI0NV1bICAgVDUzXSA9PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KWyAgIDg1LjY1NDA4
Nl1bICAgVDUzXSBCVUc6IEtBU0FOOiBudWxsLXB0ci1kZXJlZiBpbiBmc2NyeXB0X2RlY3J5cHRf
cGFnZWNhY2hlX2Jsb2NrcyAoZnMvY3J5cHRvL2NyeXB0by5jOj8pClsgICA4NS42NTQ5ODldWyAg
IFQ1M10gUmVhZCBvZiBzaXplIDEgYXQgYWRkciAwMDAwMDAwMDAwMDAwMDA5IGJ5IHRhc2sga3dv
cmtlci91MTM6MC81MwpbICAgODUuNjU1NzYzXVsgICBUNTNdClsgICA4NS42NTYwMTFdWyAgIFQ1
M10gQ1BVOiAxIFVJRDogMCBQSUQ6IDUzIENvbW06IGt3b3JrZXIvdTEzOjAgTm90IHRhaW50ZWQg
Ny4wLjAtcmM1LTAwMDUxLWdiYmViODNkMzE4MmEgIzM4IFBSRUVNUFQoZnVsbCkKWyAgIDg1LjY1
NjAyMF1bICAgVDUzXSBIYXJkd2FyZSBuYW1lOiBRRU1VIFN0YW5kYXJkIFBDIChpNDQwRlggKyBQ
SUlYLCAxOTk2KSwgQklPUyAxLjE1LjAtMSAwNC8wMS8yMDE0ClsgICA4NS42NTYwMjZdWyAgIFQ1
M10gV29ya3F1ZXVlOiBmMmZzX3Bvc3RfcmVhZF93cSBmMmZzX3Bvc3RfcmVhZF93b3JrClsgICA4
NS42NTYwMzldWyAgIFQ1M10gQ2FsbCBUcmFjZToKWyAgIDg1LjY1NjA0NF1bICAgVDUzXSAgPFRB
U0s+ClsgICA4NS42NTYwNDddWyAgIFQ1M10gIGR1bXBfc3RhY2tfbHZsIChsaWIvZHVtcF9zdGFj
ay5jOjEyMikKWyAgIDg1LjY1NjA1N11bICAgVDUzXSAgcHJpbnRfcmVwb3J0IChtbS9rYXNhbi9y
ZXBvcnQuYzo0ODcpClsgICA4NS42NTYwOTVdWyAgIFQ1M10gIGthc2FuX3JlcG9ydCAobW0va2Fz
YW4vcmVwb3J0LmM6NTk3KQpbICAgODUuNjU2MTE0XVsgICBUNTNdICBmc2NyeXB0X2RlY3J5cHRf
cGFnZWNhY2hlX2Jsb2NrcyAoZnMvY3J5cHRvL2NyeXB0by5jOj8pClsgICA4NS42NTYxMzZdWyAg
IFQ1M10gIGZzY3J5cHRfZGVjcnlwdF9iaW8gKGZzL2NyeXB0by9iaW8uYzo0MSkKWyAgIDg1LjY1
NjE5MF1bICAgVDUzXSAgZjJmc19wb3N0X3JlYWRfd29yayAoZnMvZjJmcy9kYXRhLmM6Mjk3KQpb
ICAgODUuNjU2MTk3XVsgICBUNTNdICBwcm9jZXNzX3NjaGVkdWxlZF93b3JrcyAoa2VybmVsL3dv
cmtxdWV1ZS5jOjMyODEga2VybmVsL3dvcmtxdWV1ZS5jOjMzNTkpClsgICA4NS42NTYyMDldWyAg
IFQ1M10gIHdvcmtlcl90aHJlYWQgKGtlcm5lbC93b3JrcXVldWUuYzo/KQpbICAgODUuNjU2MjMw
XVsgICBUNTNdICBrdGhyZWFkIChrZXJuZWwva3RocmVhZC5jOjQzNykKWyAgIDg1LjY1NjI0M11b
ICAgVDUzXSAgcmV0X2Zyb21fZm9yayAoYXJjaC94ODYva2VybmVsL3Byb2Nlc3MuYzoxNjQpClsg
ICA4NS42NTYyNzldWyAgIFQ1M10gIHJldF9mcm9tX2ZvcmtfYXNtIChhcmNoL3g4Ni9lbnRyeS9l
bnRyeV82NC5TOjI1NSkKWyAgIDg1LjY1NjI5MV1bICAgVDUzXSAgPC9UQVNLPgpbICAgODUuNjU2
Mjk0XVsgICBUNTNdID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PQoKCkJlc3QsClNodWFuZ3BlbmcKCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWls
aW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9s
aXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
