Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 22342C0DD1E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Oct 2025 14:06:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gkaMZ0CA3vHfdWPaiULoq8NtjsbYQUaiUKyNhYLdN+Y=; b=lLjDpNEgvzqGp7KHY+pYIW2WS0
	PCPlTtju9+5scPOEobLe1wgdwzLx3brrINDIYFbMt40JHa9lUjIewE75HO9wOD3FjA2MZTC2Mpmrj
	8ZQRoKmN6jbyMUMMrxd6VW12x76X4Aw5fjAimfyKwyXfNnERrL2JH0ghHP7Q4PWyqOFI=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vDMw0-0003RM-3y;
	Mon, 27 Oct 2025 13:06:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kartikey406@gmail.com>) id 1vDMvy-0003RD-9u
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Oct 2025 13:06:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sAcB94rt1uG1utYxMaaRSmp/fSyUuxxZEyS4GrV5uxU=; b=RYx5TLyQKnD09i4DtFEtxiayvW
 DzD1N93t5oZu0p/uJx7ZmyeFmjp9pUTn7BD/M4UgUoQs+zrKC1G6zDzUEApRy1IozfJPuI3Am2GPf
 005jn6IzMEo7VFLw+BzkY/xQl3a4oPTAXtvCWVG596nKXFou0n6f0a1qK8E2bQe8sBkg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=sAcB94rt1uG1utYxMaaRSmp/fSyUuxxZEyS4GrV5uxU=; b=E
 CukLbse0wgDWbdpnz5wKOvXgf6R9U9UqKnELNWaYwWP9UCULsvfVsy7NRt0GJyksn5yMvt2UliFxi
 tfS66aCgNZcfbwVCjyGAgATpDCkW6xGOTAU3ZyyYep3/uo7yraSYusSJDXaQ0oioBd0fgfTKe+obt
 HYKxC5ETXwG0Dt6s=;
Received: from mail-pf1-f171.google.com ([209.85.210.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vDMvx-0002UP-PY for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Oct 2025 13:06:50 +0000
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-7a28226dd13so3376255b3a.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 27 Oct 2025 06:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761570404; x=1762175204; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sAcB94rt1uG1utYxMaaRSmp/fSyUuxxZEyS4GrV5uxU=;
 b=HTsZyNJ5WmI1Z59GAlKlt4kM6N1VNAQVf1OZvL0D52K2EUQlPkXYmT6r7aB6P/3c5m
 jqJnuXpGLxAkXtw5zs5f3JO0SLgZk6FWxDsScCbX6/UdZ8y2wGEBPoW+CyZQxHK8XcK8
 yCntqPoXksCTvz9Lge8cJ7+2MHFQJhEvBAXhCBgz2FpR7SP9f3IfP+5V7kMp+OgJETmW
 WO6q9lsQoTaf1zbvim8mzADPE3t5/XcHsxD6gVeov+KsdYez/FcW2T8qBn57Kr8u4PTj
 Tt2DETl8A8ncMstX/de60rfcDqoP4NQpXEFTujzRh1oR+l/auB/fehJwxHeelrSM4Ghi
 JIeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761570404; x=1762175204;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sAcB94rt1uG1utYxMaaRSmp/fSyUuxxZEyS4GrV5uxU=;
 b=CAF8ZIWJOdNrfbAt3rHOezABQ8nOC51cGdbQXwkI+DbUjqy3jslKncbks9hgMbVe1z
 QH+qZABt+lf5yPPHFbuHeM+1v1Hz1CfAyfDva4KD3xyPVhVSZst9Obivhr2dzEKSkTJV
 rX2gqzld+leIzaPAWLsPpW9Nl9C0RNk6D8CHQ9HIxH7nVhbKJp0fSP/bDa58pV/Uwou3
 it9gegLhmpD62e14p4/F127Q0eW78Z+nYMPMVtkmEXwU/Xx/w0uUJLIa9ivWSihEQqtm
 5LZTwYDtGSIz2ZVN6nU2LWTz2g4zgMv1QmJnuudUqbdvMYAML5XwMSYbt8zzf7uJKRcv
 KYCg==
X-Gm-Message-State: AOJu0Yyfd0gV+t0OCJOl/XTVaiz6fOXUdyu1VNY5YMbgoyUqn1nPQ5J6
 rUeeQSufXfFE+F/42ff8SsmyGuSaYru+SVtuYFJXg9Y/YKDOjGMghSc2
X-Gm-Gg: ASbGncs+TwFkZI+A8ejZ1e1CbDf1H4CZUS2dgRhCTPyjFTGy6iaUKh9rE6erbsZIHJ9
 vjGj9Go0RsCt7BXgMhSSm3+otPDF2XoQ+L2/yVcdPFr3Wt7M8DsDk5aGMjq/2GeEj7RD63WVOcx
 0fhvIKM6WGdfWmzPQqgP8kwtmoOoGd5D5p8nKsYI6h+ORpR3otP727wD988d9ke83m1hS8vO2UV
 q1ObC0s6yLxsvh7ZGoftcBxfk/iUDAoAfo6RMHJFcjDDmss+w01fMyGeWSNkaKLcHIgAKkBtGL6
 XSI+NYoOmcz2yK45fvxAF+cfkmT+tNpFaJd2gqxrP78nj9OKSjY8hRvbr/V327NcE1eWew7lle7
 qat6mgyjBdAipskB0W5X128+929gkF6YjBNXXpjjTVmazKlvLP1m1FBFmEDjHQDg+mnYQpdY3zi
 ADthNwAqed66WdY0CGcBNGii4=
X-Google-Smtp-Source: AGHT+IFDBFQhu6H8WRS3G5jmj6Lqwp/4wmrDvIHwDdiFCiGPdJW6/tnWwumkgtAM7uP2nl3Z20LJrw==
X-Received: by 2002:a05:6a00:9501:b0:783:7de9:d3c5 with SMTP id
 d2e1a72fcca58-7a220d377d9mr45674430b3a.29.1761570403480; 
 Mon, 27 Oct 2025 06:06:43 -0700 (PDT)
Received: from deepanshu-kernel-hacker..
 ([2405:201:682f:389d:fac6:8aa5:82e:7fef])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a414012899sm8253997b3a.0.2025.10.27.06.06.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 06:06:42 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 27 Oct 2025 18:36:34 +0530
Message-ID: <20251027130635.13739-1-kartikey406@gmail.com>
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
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.171 listed in wl.mailspike.net]
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
X-Headers-End: 1vDMvx-0002UP-PY
Subject: [f2fs-dev] [PATCH v2] f2fs: invalidate dentry cache on failed
 whiteout creation
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
 syzbot+632cf32276a9a564188d@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
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
CgpJbiB0aGUgZXJyb3IgcGF0aCwgVkZTIGRvZXMgbm90IGNhbGwgZF9tb3ZlKCkgdG8gdXBkYXRl
IHRoZSBkZW50cnkKY2FjaGUuIFRoaXMgcmVzdWx0cyBpbiBuZXdfZGVudHJ5IHN0aWxsIHBvaW50
aW5nIHRvIHRoZSBvbGQgaW5vZGUKKG5ld19pbm9kZSkgd2hpY2ggaGFzIGFscmVhZHkgaGFkIGl0
cyBpX25saW5rIGRlY3JlbWVudGVkIHRvIHplcm8uClRoZSBzdGFsZSBjYWNoZSBjYXVzZXMgc3Vi
c2VxdWVudCBvcGVyYXRpb25zIHRvIGluY29ycmVjdGx5IHJlZmVyZW5jZQp0aGUgZnJlZWQgaW5v
ZGUuCgpUaGlzIGNhdXNlcyBzdWJzZXF1ZW50IG9wZXJhdGlvbnMgdG8gdXNlIGNhY2hlZCBkZW50
cnkgaW5mb3JtYXRpb24gdGhhdApubyBsb25nZXIgbWF0Y2hlcyB0aGUgb24tZGlzayBzdGF0ZS4g
V2hlbiBhIHNlY29uZCByZW5hbWUgdGFyZ2V0cyB0aGUKc2FtZSBlbnRyeSwgVkZTIGF0dGVtcHRz
IHRvIGRlY3JlbWVudCBpX25saW5rIG9uIHRoZSBzdGFsZSBpbm9kZSwgd2hpY2gKbWF5IGFscmVh
ZHkgaGF2ZSBpX25saW5rPTAsIHRyaWdnZXJpbmcgYSBXQVJOSU5HIGluIGRyb3BfbmxpbmsoKS4K
CkV4YW1wbGUgc2VxdWVuY2U6CjEuIEZpcnN0IHJlbmFtZSAoUkVOQU1FX1dISVRFT1VUKTogZmls
ZTIg4oaSIGZpbGUxCiAgIC0gZjJmcyB1cGRhdGVzIGZpbGUxIGVudHJ5IG9uIGRpc2sgKHBvaW50
cyB0byBpbm9kZSA4KQogICAtIGYyZnMgZGVsZXRlcyBmaWxlMiBlbnRyeSBvbiBkaXNrCiAgIC0g
ZjJmc19hZGRfbGluayh3aGl0ZW91dCkgZmFpbHMgKGNvcnJ1cHRlZCBkaXJlY3RvcnkpCiAgIC0g
UmV0dXJucyBlcnJvciB0byBWRlMKICAgLSBWRlMgZG9lcyBub3QgY2FsbCBkX21vdmUoKSBkdWUg
dG8gZXJyb3IKICAgLSBWRlMgY2FjaGUgc3RpbGwgaGFzOiBmaWxlMSDihpIgaW5vZGUgNyAoc3Rh
bGUhKQogICAtIGlub2RlIDcgaGFzIGlfbmxpbms9MCAoYWxyZWFkeSBkZWNyZW1lbnRlZCkKCjIu
IFNlY29uZCByZW5hbWU6IGZpbGUzIOKGkiBmaWxlMQogICAtIFZGUyB1c2VzIHN0YWxlIGNhY2hl
OiBmaWxlMSDihpIgaW5vZGUgNwogICAtIFRyaWVzIHRvIGRyb3Bfbmxpbmsgb24gaW5vZGUgNyAo
aV9ubGluayBhbHJlYWR5IDApCiAgIC0gV0FSTklORyBpbiBkcm9wX25saW5rKCkKCkZpeCB0aGlz
IGJ5IGV4cGxpY2l0bHkgaW52YWxpZGF0aW5nIG9sZF9kZW50cnkgYW5kIG5ld19kZW50cnkgd2hl
bgpmMmZzX2FkZF9saW5rIGZhaWxzIGR1cmluZyB3aGl0ZW91dCBjcmVhdGlvbi4gVGhpcyBmb3Jj
ZXMgVkZTIHRvCnJlZnJlc2ggZnJvbSBkaXNrIG9uIHN1YnNlcXVlbnQgb3BlcmF0aW9ucywgZW5z
dXJpbmcgY2FjaGUgY29uc2lzdGVuY3kKZXZlbiB3aGVuIHRoZSByZW5hbWUgcGFydGlhbGx5IHN1
Y2NlZWRzLgoKUmVwcm9kdWNlcjoKMS4gTW91bnQgRjJGUyBpbWFnZSB3aXRoIGNvcnJ1cHRlZCBp
X2N1cnJlbnRfZGVwdGgKMi4gcmVuYW1lYXQyKGZpbGUyLCBmaWxlMSwgUkVOQU1FX1dISVRFT1VU
KQozLiByZW5hbWVhdDIoZmlsZTMsIGZpbGUxLCAwKQo0LiBTeXN0ZW0gdHJpZ2dlcnMgV0FSTklO
RyBpbiBkcm9wX25saW5rKCkKCkZpeGVzOiA3ZTAxZTdhZDc0NmIgKCJmMmZzOiBzdXBwb3J0IFJF
TkFNRV9XSElURU9VVCIpClJlcG9ydGVkLWJ5OiBzeXpib3QrNjMyY2YzMjI3NmE5YTU2NDE4OGRA
c3l6a2FsbGVyLmFwcHNwb3RtYWlsLmNvbQpDbG9zZXM6IGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNw
b3QuY29tL2J1Zz9leHRpZD02MzJjZjMyMjc2YTlhNTY0MTg4ZApTdWdnZXN0ZWQtYnk6IENoYW8g
WXUgPGNoYW9Aa2VybmVsLm9yZz4KTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIw
MjUxMDIyMjMzMzQ5LjEwMjcyOC0xLWthcnRpa2V5NDA2QGdtYWlsLmNvbS8gW3YxXQpDYzogc3Rh
YmxlQHZnZXIua2VybmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiBEZWVwYW5zaHUgS2FydGlrZXkgPGth
cnRpa2V5NDA2QGdtYWlsLmNvbT4KLS0tCkNoYW5nZXMgaW4gdjI6Ci0gQWRkZWQgZGV0YWlsZWQg
ZXhwbGFuYXRpb24gYWJvdXQgVkZTIG5vdCBjYWxsaW5nIGRfbW92ZSgpIGluIGVycm9yIHBhdGgs
CiAgcmVzdWx0aW5nIGluIG5ld19kZW50cnkgc3RpbGwgcG9pbnRpbmcgdG8gaW5vZGUgd2l0aCB6
ZXJvZWQgaV9ubGluawogIChzdWdnZXN0ZWQgYnkgQ2hhbyBZdSkKLSBBZGRlZCBGaXhlcyB0YWcg
cG9pbnRpbmcgdG8gY29tbWl0IDdlMDFlN2FkNzQ2YgotIEFkZGVkIENjOiBzdGFibGVAdmdlci5r
ZXJuZWwub3JnIGZvciBiYWNrcG9ydGluZyB0byBzdGFibGUga2VybmVscwotLS0KIGZzL2YyZnMv
bmFtZWkuYyB8IDYgKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2ZzL2YyZnMvbmFtZWkuYyBiL2ZzL2YyZnMvbmFtZWku
YwppbmRleCBiODgyNzcxZTQ2OTkuLjcxMjQ3OWI3YjkzZCAxMDA2NDQKLS0tIGEvZnMvZjJmcy9u
YW1laS5jCisrKyBiL2ZzL2YyZnMvbmFtZWkuYwpAQCAtMTA1Myw5ICsxMDUzLDExIEBAIHN0YXRp
YyBpbnQgZjJmc19yZW5hbWUoc3RydWN0IG1udF9pZG1hcCAqaWRtYXAsIHN0cnVjdCBpbm9kZSAq
b2xkX2RpciwKIAlpZiAod2hpdGVvdXQpIHsKIAkJc2V0X2lub2RlX2ZsYWcod2hpdGVvdXQsIEZJ
X0lOQ19MSU5LKTsKIAkJZXJyID0gZjJmc19hZGRfbGluayhvbGRfZGVudHJ5LCB3aGl0ZW91dCk7
Ci0JCWlmIChlcnIpCisJCWlmIChlcnIpIHsKKwkJCWRfaW52YWxpZGF0ZShvbGRfZGVudHJ5KTsK
KwkJCWRfaW52YWxpZGF0ZShuZXdfZGVudHJ5KTsKIAkJCWdvdG8gcHV0X291dF9kaXI7Ci0KKwkJ
fQogCQlzcGluX2xvY2soJndoaXRlb3V0LT5pX2xvY2spOwogCQl3aGl0ZW91dC0+aV9zdGF0ZSAm
PSB+SV9MSU5LQUJMRTsKIAkJc3Bpbl91bmxvY2soJndoaXRlb3V0LT5pX2xvY2spOwotLSAKMi40
My4wCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNl
Zm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xp
bnV4LWYyZnMtZGV2ZWwK
