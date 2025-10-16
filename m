Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F2FBE17F9
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Oct 2025 07:17:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ac5jLbmqsZ+bFu0s2LTf972b6UrhWire+pBXHAauLEE=; b=H64RvyDRQluQWMdOhw+zJaTi86
	aNidDwG8k4LBalBvIoq3SIi0AYvzjlAzhToetZbQR1b2kLPYN7c96puHS9ZxE9FON1+Ng9zf8tP+C
	+3zFyWG6heMlUGCTWjlvaTimZ9NzPBW3O19Hrsem9bB0XmoSsnO2LuwFCvIQ/mPShEps=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v9GM9-0008LI-10;
	Thu, 16 Oct 2025 05:16:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jeuk20.kim@gmail.com>) id 1v9GM6-0008Kw-SL
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Oct 2025 05:16:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pigqJGC+B272ixDTo1WsT4TFwZwGZ84ntnAlQQ1cee8=; b=JUbO9bJhYbBcI+MSISGWjHrgIF
 AUCA8d+Ol/4O2AfckQIFMMWteYSvYqz3mlbOpRKM5lpbBOtm68e7BEloFToK47BJ4ypMfg22oh9y5
 yq/xCMQPGQCQ72MSF2gtH8/Ky9//9i9vBQyrGe2YXZ2RjqCrF9hVusVG9o4eI7WxOBik=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=pigqJGC+B272ixDTo1WsT4TFwZwGZ84ntnAlQQ1cee8=; b=Y
 DiGDvHh9Wa+WCEZsVgpbRK7gbmFLj5cy6m520J6sgisymLFe4ZbwXxmRq9S7a4bTtzohLX2vz2O+N
 lFaCbJ+3WGGFaiKZa5WR+DGaKNgvuLiGu2vriJHFgxELtaNv3sP5J2o4B/C/7EEjez6hY3sEyMUnH
 0xNBNRjOMp8Yxt/Y=;
Received: from mail-pj1-f54.google.com ([209.85.216.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v9GM7-0003sO-9Y for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Oct 2025 05:16:51 +0000
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-33b5a3e8ae2so1231680a91.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 15 Oct 2025 22:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760591801; x=1761196601; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pigqJGC+B272ixDTo1WsT4TFwZwGZ84ntnAlQQ1cee8=;
 b=GIyN1Wm5zFZ3iW73RN+3sWsuptiChO3X12BnO5TgcGX6D7dO9HcsjEpRnMs9Ze3Avz
 fnaqKwzUpZ1rSRn5ls3Lx6EIV6BsYaswkvG+4ToJO1Cen74wT3UsYde5TAluVoElZEM+
 QJjWtV5ZJ/7cN1UnVjcofXqB10CHR0QFFmpgEQ33+mSbhBGRJgoAIbezVHSTGLTrTNK9
 Bx2SehI9zwtoeIdj36SKxV5kN+281Xw11EDahh/dCUMqU5kGztkhTyaIZ2NH1l5ZqR8Y
 CFShWpVwS6ohu5LWFdNZXm5DT+GPQYmX45sgKoBK/vvR5YUQpHSETumbcCcGXgbT/lb+
 Chuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760591801; x=1761196601;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pigqJGC+B272ixDTo1WsT4TFwZwGZ84ntnAlQQ1cee8=;
 b=qM0i5SeEWg/sG2sMHPfaZ93ibB3ymkJWpjjjV+s298A+UHxBBv+A6PNZSXLhSb+ILz
 EzXsveNJkIL8huM4JX5wtZ0Yp4Cr2+6+feeGkWlvnhbdCCdcD6XzvYMvguL5PuTOUVLy
 Lyls0SYLAwKueaQ5UgCCbFFxRce9qgt6q0NVWsrvRZ3FSj0KfEK5ujhR07D8eECkD9K6
 r7tuLrxw2xw68I/ZnS09iYeDo5ZpeqIoVyt+74HRkAPqOzaJfzUr1eAF3G1EIAKp7WZj
 xfRT6oHbpSwdsVXlUl4Fh/d7E4Rv29AL82lSXr0HX6sDvqUunuW0p71U/uN9W7UtGqYm
 122w==
X-Gm-Message-State: AOJu0YyCh5NlkW0eddf+1zEnMTUt/QMdD7U7p9PLdak0v4pYiGNyES6S
 5dJThL5t9cbdSLHeG+Bz3qg+OHcoAOfPssf4j7FvbZ+sGcbvMfTvUMMq
X-Gm-Gg: ASbGncuhXThxioteGB19Iklkrss6T3peOdv51h/EG8uATI526bhrmIV5a1kF/Lgd+5g
 ogvnCE0FMGTtYhaXs9k2+I4jtMTOWPtAOKUZf47EUjJDYFlHrtKGLh9tfZYg7Wg2zgvS2BtZthA
 1V8tzPbDdTMgYZfgRp1fBP6JcAHmt2LoVKRlYTgWGmKksR+2obozx59JapphEqOTO4rBvoTmDrb
 xiOtIWhCR6iBfh8oYFAoiY75i3As0Gy0f2+pT38AyB9iR38q9IcntQ/69Bj1XDYOViONPgRU21w
 hLkzZDXT+njAKyd4UWl5Ul6Q/8aq1bWYj29cECFZi08Lgi1YmLSRJX575WCRjE7qdqp8Z/kgTkI
 hCX/3deCCAu0FvgR6vwIQqJT3EKOTPqxThhAWaztfcQuoivIRF0DTc94i2nzbr0nUfjjLzA2phs
 Wjud53TQRo/Yik2w==
X-Google-Smtp-Source: AGHT+IF0/K4q2jQn9UOtDGAHunWEgJG1TbfokjhDoIk1ay6EYVQXYRPGachSbGMLIS9aV8kVIq+UWw==
X-Received: by 2002:a17:90b:268e:b0:330:55de:8c20 with SMTP id
 98e67ed59e1d1-33b9e09006bmr3258974a91.2.1760591800552; 
 Wed, 15 Oct 2025 22:16:40 -0700 (PDT)
Received: from jeuk-MS-7D42.. ([175.119.5.143])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7992b0606f0sm21261497b3a.15.2025.10.15.22.16.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 22:16:39 -0700 (PDT)
From: Jeuk Kim <jeuk20.kim@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 16 Oct 2025 14:16:21 +0900
Message-ID: <20251016051621.7425-1-jeuk20.kim@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Jeuk Kim Inline encryption derives DUN from <inode,
 file offset>, so bios from different inodes can't merge. With multi-threaded
 buffered O_SYNC writes where each thread writes to its own file, 4KiB-per-page
 L [...] Content analysis details:   (-0.2 points, 5.0 required)
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
 [jeuk20.kim(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.54 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1v9GM7-0003sO-9Y
Subject: [f2fs-dev] [PATCH] f2fs: serialize writeback for inline-crypto
 inodes
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
Cc: hyenc.jeong@samsung.com, jieon.seol@samsung.com, gyusun.lee@samsung.com,
 wone.jung@samsung.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, d_hyun.kwon@samsung.com,
 jeuk20.kim@samsung.com, jaemyung.lee@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RnJvbTogSmV1ayBLaW0gPGpldWsyMC5raW1Ac2Ftc3VuZy5jb20+CgpJbmxpbmUgZW5jcnlwdGlv
biBkZXJpdmVzIERVTiBmcm9tIDxpbm9kZSwgZmlsZSBvZmZzZXQ+LApzbyBiaW9zIGZyb20gZGlm
ZmVyZW50IGlub2RlcyBjYW4ndCBtZXJnZS4gV2l0aCBtdWx0aS10aHJlYWRlZApidWZmZXJlZCBP
X1NZTkMgd3JpdGVzIHdoZXJlIGVhY2ggdGhyZWFkIHdyaXRlcyB0byBpdHMgb3duIGZpbGUsCjRL
aUItcGVyLXBhZ2UgTEJBIGFsbG9jYXRpb24gaW50ZXJsZWF2ZXMgYWNyb3NzIGlub2RlcyBhbmQK
Y2F1c2VzIGJpbyBzcGxpdC4gU2VyaWFsaXplIHdyaXRlYmFjayBmb3IgZnNjcnlwdCBpbmxpbmUt
Y3J5cHRvCmlub2RlcyB2aWEgX19zaG91bGRfc2VyaWFsaXplX2lvKCkgdG8ga2VlcCBmb3JlZ3Jv
dW5kIHdyaXRlYmFjawpmb2N1c2VkIG9uIG9uZSBpbm9kZSBhbmQgYXZvaWQgc3BsaXQuCgpUZXN0
OiBmaW8gLS1uYW1lPXdiX29zeW5jIC0tcnc9d3JpdGUgLS1icz0xTSBcCiAgICAgIC0tdGltZV9i
YXNlZD0xIC0tcnVudGltZT02MHMgLS1zaXplPTJHIFwKICAgICAgLS1pb2VuZ2luZT1wc3luYyAt
LWRpcmVjdD0wIC0tc3luYz0xIFwKICAgICAgLS1udW1qb2JzPTggLS10aHJlYWQ9MSAtLW5yZmls
ZXM9MSBcCiAgICAgIC0tZmlsZW5hbWVfZm9ybWF0PSd3Yl9vc3luYy4kam9ibnVtJwoKZGV2aWNl
OiBVRlMKCkJlZm9yZSAtCiAgd3JpdGUgdGhyb3VnaHB1dDogNjc1TWlCL3MKICBkZXZpY2UgSS9P
IHNpemUgZGlzdHJpYnV0aW9uIChieSBjb3VudCwgdG90YWwgMTAyNzQxNCk6CiAgICA0IEtpQjog
IDkyMzEzOSAoODkuOSUpCiAgICA4IEtpQjogIDg0Nzk4ICg4LjMlKQogICAg4omlNTEyIEtpQjog
NDUzICgwLjAlKQoKQWZ0ZXIgLQogIHdyaXRlIHRocm91Z2hwdXQ6IDE3NjBNaUIvcwogIGRldmlj
ZSBJL08gc2l6ZSBkaXN0cmlidXRpb24gKGJ5IGNvdW50LCB0b3RhbCAyMzE3NTApOgogICAgNCBL
aUI6ICAxNjkwNCAoNy4zJSkKICAgIDggS2lCOiAgNzIxMjggKDMxLjElKQogICAg4omlNTEyIEtp
QjogMTE4OTAwICg1MS4zJSkKClNpZ25lZC1vZmYtYnk6IEpldWsgS2ltIDxqZXVrMjAua2ltQHNh
bXN1bmcuY29tPgotLS0KIGZzL2YyZnMvZGF0YS5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9kYXRh
LmMKaW5kZXggZWYzOGU2MmNkYThmLi5hZTZmYjQzNWQ1NzYgMTAwNjQ0Ci0tLSBhL2ZzL2YyZnMv
ZGF0YS5jCisrKyBiL2ZzL2YyZnMvZGF0YS5jCkBAIC0zMjE3LDYgKzMyMTcsOCBAQCBzdGF0aWMg
aW5saW5lIGJvb2wgX19zaG91bGRfc2VyaWFsaXplX2lvKHN0cnVjdCBpbm9kZSAqaW5vZGUsCiAK
IAlpZiAoZjJmc19uZWVkX2NvbXByZXNzX2RhdGEoaW5vZGUpKQogCQlyZXR1cm4gdHJ1ZTsKKwlp
ZiAoZnNjcnlwdF9pbm9kZV91c2VzX2lubGluZV9jcnlwdG8oaW5vZGUpKQorCQlyZXR1cm4gdHJ1
ZTsKIAlpZiAod2JjLT5zeW5jX21vZGUgIT0gV0JfU1lOQ19BTEwpCiAJCXJldHVybiB0cnVlOwog
CWlmIChnZXRfZGlydHlfcGFnZXMoaW5vZGUpID49IFNNX0koRjJGU19JX1NCKGlub2RlKSktPm1p
bl9zZXFfYmxvY2tzKQotLSAKMi40My4wCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYy
ZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2Uu
bmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
