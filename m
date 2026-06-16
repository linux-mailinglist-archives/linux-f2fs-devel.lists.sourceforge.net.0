Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rYZmJF6sMGqAWAUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 03:52:30 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AD368B58A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 03:52:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=Ta65yBMf;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=ZRJASqBz;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=WMQC+VET;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=iIXPhOeA;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:google.com:reject}")
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TpuAbLZhEiB2/UNPEAqIxnLlkKD/5e1/8jnkSIv4XpQ=; b=Ta65yBMfSF/BgROMiH/+k5pxn+
	oqMHwyYG+FvdrZ2NPEuhUviTvywKcWwi2AMthntyFzFORJqX0K/DVKSdamBlYygTTalboeODGh+Zf
	58LZgSJMnGQZ4F0LXx5VX9tTELtD3laJRpNnjLKsbLWjw8Mlt5rizXjE4Vz1eHROaL4o=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZIyV-0003cg-EF;
	Tue, 16 Jun 2026 01:52:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1wZIyT-0003ca-Uz
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 01:52:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5h4RBgk0Ah9B4BM2/t7QnGbtRD1yhG2UE7N3bTCgEqg=; b=ZRJASqBznPOx+CV+pm6xVr+P8x
 fTHHcBQMu7iCj5HKbcYoTdam1PkcpHCPEUDAKcj6XkhgyT8+ewfv3xb3BYj0UvtAAEwz84EWIzrSL
 Z45cvGLvg2SK32FoE5AQ8VMEil+Pz5roIUSN0jQfGXSSPT2Lox2x1U/I+NmecrLMoxWE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5h4RBgk0Ah9B4BM2/t7QnGbtRD1yhG2UE7N3bTCgEqg=; b=WMQC+VEToOyiP7nqLIs7K4ajkv
 V6VJJ5yI1/9s5lx4dOXjO7mTtdSrqpr52fY1qDFRtdunc6AFkWB20gitjtzw1jO2AVktRIhXBHyg+
 AGm/0KQQxvdXSiBDktU5jt/FlncEXfk8x++JfE+TnYrA7WRK5ivvoTKr8fjlQVN30+kw=;
Received: from mail-yx1-f54.google.com ([74.125.224.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wZIyS-0001Dg-S0 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 01:52:21 +0000
Received: by mail-yx1-f54.google.com with SMTP id
 956f58d0204a3-66061993121so4092449d50.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 15 Jun 2026 18:52:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781574730; cv=none;
 d=google.com; s=arc-20240605;
 b=WRJa8nnYLiz1PMkVSAvNAUWxAXTrER85E594BA8ShD5CIo04K2IXF69vJhDKLIIVCL
 6ogJdeEM2GgvMvM35381aSo+rC3owU3j+jJmqIiDXoxPjJdQFePzYM3SAliJL2LAXdJR
 yH9uNijCbNd0MoWkpv8ovk8Xm/vqYL/uo8ZYBw0IFnH7v2+i68zNXscUddfD9kofoLZg
 bwhPxJOvmXCWh6JF+OBwOoWZEdh0OoWNFCWCbMXy2vBorlPlEe03TA6NgQftZe076UdF
 PZgxev9z+x53j4nFEMOEnBgHdaYhfaREezkkfG1pdf60GYBfEJzULHcsbqwt3OrcGaup
 SMkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=5h4RBgk0Ah9B4BM2/t7QnGbtRD1yhG2UE7N3bTCgEqg=;
 fh=UNLUFazUrgTyEe9Gti5Tsh1+Yn1ck8pPT8MFdkNt/m0=;
 b=GaV4yYxEMSYEYWuKfo+zgmHQ4h2v9M09Nc5aZ6Wiu0qv1u6VC5t8OtDKe6Z2TkEyRo
 bolK/LSyHu/5Wix3yGDmjnpPSf9jnPhBGSQz+dr0S+xt4W3005ezYd2+ABvT4BqR9Ybb
 aCwzJKWMbddE5rgM2zUyMjTHrGmuzMh9LLKEHYQxpeW2DhTdtrGqIuf/of7wXuwN5exF
 W0btF0jKM2Q7QQ9GjVFjY4WKKf+8waN9qiPunwP15s9XH1Z1CWxKzufteKb41A7EmzI/
 bsRISd6cPc5BP+1HrE8CkPsYseb4uAEWapOJQTO23yxiN0EpT87dBAYxXtViNR/7CHH1
 e6WA==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781574730; x=1782179530; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5h4RBgk0Ah9B4BM2/t7QnGbtRD1yhG2UE7N3bTCgEqg=;
 b=iIXPhOeAnE3qXbHmsZ3GpnDm8Qz/oujKF0GP2cuaO87nRIfkuCF/OuS+ddwgerCIsp
 zjmt5TokJnsWd0punnkcDs9gT4SgW0gDyXmdXHiAGfnKAz7C6ehMzmMJau4HVEcQukSf
 Re8ft28td7qJFEXzPTf8+tXas1+NKvQi1J0/ms/IHKqxx8r+eylBDBxH5DjdIL7pGB2O
 w1ruEHoPtzG1jy6co0hn4rz5+45uJ9EmEnnvIuQDELa22yT3O/5EJPo1VbJj4vaIWV14
 dTw11TaboGvycqUEEPaEBC00dfbou7rMom00s/meD6KSWSc8ktWgR+N0OEPQmLPxPD+I
 i7wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781574730; x=1782179530;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5h4RBgk0Ah9B4BM2/t7QnGbtRD1yhG2UE7N3bTCgEqg=;
 b=G/Mc0ITRkJ8fU5gNW7LdCcqdPDmJ/2Wm3/dzm6lypxf23PJYdkS8pr2nJpxl7madi9
 oSzfGpULb+L4C8A+/0rNwhzW6aqoYGbSHtvDcwelewCbArJM3MxFnp0RRd+2x52TpUi3
 F5a7iwZLKB4cCp8uBOuxiJ3h+rI0B7Y4O8zRxPi5D6W+l1cmJ3a3h/kXTayYkIYRXjk2
 UvQyxzBRqExpSkxeF9U/UYEXszdzSCKcHnMvy7e/ABgcw+jhLitJf7kUmbtQGzcGsAZg
 1mof+f4GQGpExx33wJICIgsjMCuTJwm8D+hK1+nKaiOf9uAMnsnOEgWEukYqkwTFmnhL
 hmJQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9UNsgmLmE+1SCUdou8e//IRyBWgadT5HAkjo4YONPXEwjfTPUnpCRrMdm9nlfbKpv1P+FAMiakr8tWvI8F3/vK@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yxm33PaL5VG+uThCHLcVJ2b+WS2vIJsvQ8NSk1ITjBVv2LCJRie
 JkFVJ41cT2i1iB9NYF4Scx64F7OrGr9VcqkrGSkWjhwEKYZi+Q0Igrx8GcjO+mNfqX4gTuIzWFa
 VelfkgmX8bkkHIg0PSatDLaNTGsF67Mw=
X-Gm-Gg: Acq92OFvB/B/KstITOHWhaWMICr8SDPJhDF+dW8WjzNFNHas0HrKZVhrFReuOJpDhxn
 SMKuO+UjcRAY0jjQzduKB0mYXJ1balo047FAj4g27hU6knVNlmQ+QU3yR6XoNzAG3AYniwJZx0o
 3YGacuJp44UwGh+3cV+r/8q8fI/FYgmJkJ6hWoiQAQnDm6S0L/BbzBZtVExGDRV4+om6J7Cb+Iq
 rJpb7g4Y4PbZpNnMqy1FHl4IqI7HvjzWTY2wVbtwUo2OcP130GMvDT9UDrY2cMPpZgYvWmt/ql1
 fd8sg2T/
X-Received: by 2002:a05:690e:1510:b0:660:77b5:5342 with SMTP id
 956f58d0204a3-66284dcd7c0mr11943774d50.2.1781574730434; Mon, 15 Jun 2026
 18:52:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260526034439.1017521-1-qiwenjie@xiaomi.com>
 <64e16f06-e7de-404f-9424-bedb9067d90f@kernel.org>
In-Reply-To: <64e16f06-e7de-404f-9424-bedb9067d90f@kernel.org>
From: Wenjie Qi <qwjhust@gmail.com>
Date: Tue, 16 Jun 2026 09:51:57 +0800
X-Gm-Features: AVVi8CcYJr4HjvFag5-znxfgUhqN9aPNC9sN_dUwCDcU9P5tiorCtCeEzEUY_ew
Message-ID: <CAGFpFsRjfvBYNsa+HhBLYAae7ovcnEnNN7+Nz6Nh-CzKKSfVQA@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  I rechecked the lifetime path and updated the patch in v3.
 v3 drops the waitqueue protocol change and no longer frames this as a cp_wait
 UAF fix. It follows your suggestion to use the post-decrement counter value
 for the wakeup decision. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [qwjhust(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [74.125.224.54 listed in wl.mailspike.net]
X-Headers-End: 1wZIyS-0001Dg-S0
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: avoid cp_wait use-after-free in
 f2fs_write_end_io()
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
Cc: jaegeuk@kernel.org, qiwenjie@xiaomi.com, linux-kernel@vger.kernel.org,
 stable@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.09 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:qiwenjie@xiaomi.com,m:linux-kernel@vger.kernel.org,m:stable@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,xiaomi.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B1AD368B58A

ICBJIHJlY2hlY2tlZCB0aGUgbGlmZXRpbWUgcGF0aCBhbmQgdXBkYXRlZCB0aGUgcGF0Y2ggaW4g
djMuCgogIHYzIGRyb3BzIHRoZSB3YWl0cXVldWUgcHJvdG9jb2wgY2hhbmdlIGFuZCBubyBsb25n
ZXIgZnJhbWVzIHRoaXMgYXMKYQogIGNwX3dhaXQgVUFGIGZpeC4gSXQgZm9sbG93cyB5b3VyIHN1
Z2dlc3Rpb24gdG8gdXNlIHRoZQpwb3N0LWRlY3JlbWVudAogIGNvdW50ZXIgdmFsdWUgZm9yIHRo
ZSB3YWtldXAgZGVjaXNpb24uCgogIEkgdXNlZCAhYXRvbWljX2RlY19yZXR1cm4oKSwgc2luY2Ug
dGhlIGxhc3QgRjJGU19XQl9DUF9EQVRBCmNvbXBsZXRpb24KICByZXR1cm5zIHplcm8uCgogaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtZjJmcy1kZXZlbC8yMDI2MDYxNjAxNDc0Mi42NzIz
Ni0xLXFpd2VuamllQHhpYW9taS5jb20vVC8jdQoKICBUaGFua3MsCgpPbiBXZWQsIEp1biAxMCwg
MjAyNiBhdCA3OjEy4oCvUE0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9u
IDUvMjYvMjYgMTE6NDQsIFdlbmppZSBRaSB3cm90ZToKPiA+IGYyZnNfd3JpdGVfZW5kX2lvKCkg
ZGVjcmVtZW50cyB0aGUgd3JpdGViYWNrIHBhZ2UgY291bnRlciBiZWZvcmUgd2FraW5nCj4gPiBz
YmktPmNwX3dhaXQgZm9yIHRoZSBsYXN0IEYyRlNfV0JfQ1BfREFUQSBjb21wbGV0aW9uLgo+ID4K
PiA+IFRoYXQgZGVjcmVtZW50IGNhbiBkcm9wIHRoZSBGMkZTX1dCX0NQX0RBVEEgY291bnQgdG8g
emVyby4gSXQgY2FuIHVuYmxvY2sKPiA+IGEgY29uY3VycmVudCB1bm1vdW50IHBhdGggd2FpdGlu
ZyBpbiBmMmZzX3dhaXRfb25fYWxsX3BhZ2VzKCkuIFVubW91bnQgY2FuCj4gPiB0aGVuIGNvbnRp
bnVlIHRocm91Z2ggZjJmc19wdXRfc3VwZXIoKSBhbmQgZnJlZSBzYmkgd2hpbGUgdGhlIGVuZF9p
bwo+ID4gY2FsbGJhY2sgaXMgc3RpbGwgYWJvdXQgdG8gZXZhbHVhdGUgd3FfaGFzX3NsZWVwZXIo
KSBhbmQgd2FrZV91cCgpIG9uCj4gPiBzYmktPmNwX3dhaXQuCj4gPgo+ID4gQ29tbWl0IDJkOWM0
YTRlZDRlZSAoImYyZnM6IGZpeCBVQUYgY2F1c2VkIGJ5IGRlY3JlbWVudGluZwo+ID4gc2JpLT5u
cl9wYWdlc1tdIGluIGYyZnNfd3JpdGVfZW5kX2lvKCkiKSBmaXhlZCBvbmUgcG9zdC1kZWNyZW1l
bnQgc2JpCj4gPiBhY2Nlc3MgYnkgbW92aW5nIHRoZSB3YXJtLW5vZGUtbGlzdCBoYW5kbGluZyBi
ZWZvcmUgZGVjX3BhZ2VfY291bnQoKS4gVGhlCj4gPiBjb21wcmVzc2VkIHdyaXRlYmFjayBwYXRo
IGZvbGxvd3MgdGhlIHNhbWUgcnVsZSBhbmQgZG9jdW1lbnRzIHRoYXQKPiA+IHNiaSBhY2Nlc3Nl
cyBtdXN0IGhhcHBlbiBiZWZvcmUgZGVjX3BhZ2VfY291bnQoKSBjYW4gZHJvcCB0aGUKPiA+IEYy
RlNfV0JfQ1BfREFUQSBjb3VudCB0byB6ZXJvLgo+ID4KPiA+IFVzZSBhdG9taWNfZGVjX2FuZF9s
b2NrX2lycXNhdmUoKSBmb3IgRjJGU19XQl9DUF9EQVRBIGNvbXBsZXRpb25zIHNvIHRoZQo+ID4g
emVybyB0cmFuc2l0aW9uIGlzIHNlcmlhbGl6ZWQgd2l0aCBjcF93YWl0LmxvY2suIFdoZW4gdGhl
IGNvdW50IHJlYWNoZXMKPiA+IHplcm8sIHdha2Ugd2FpdGVycyB3aGlsZSBob2xkaW5nIHRoZSBz
YW1lIGxvY2suCj4gPgo+ID4gSW4gZjJmc193YWl0X29uX2FsbF9wYWdlcygpLCBwcmVwYXJlIHRo
ZSB3YWl0ZXIgYW5kIHJlY2hlY2sgdGhlIHBhZ2UgY291bnQKPiA+IHdoaWxlIGhvbGRpbmcgY3Bf
d2FpdC5sb2NrIGJlZm9yZSBzbGVlcGluZy4gVGhpcyBrZWVwcyB0aGUgd2FrZXVwIHZpc2libGUK
PiA+IHRvIHdhaXRlcnMgd2l0aG91dCByZXF1aXJpbmcgdGhlIGVuZF9pbyBjYWxsYmFjayB0byBh
Y2Nlc3Mgc2JpIGFmdGVyIHRoZQo+ID4gRjJGU19XQl9DUF9EQVRBIGNvdW50IGhhcyByZWFjaGVk
IHplcm8uIEl0IGFsc28gYXZvaWRzIGEgbWlzc2VkIHdha2V1cCB0aGF0Cj4gPiB3b3VsZCBvdGhl
cndpc2UgbWFrZSB0aGUgd2FpdGVyIHNsZWVwIHVudGlsIERFRkFVTFRfU0NIRURVTEVfVElNRU9V
VC4KPiA+Cj4gPiBGaXhlczogY2UyNzM5ZTQ4MmJjICgiZjJmczogZml4IHRvIGF2b2lkIFVBRiBp
biBmMmZzX3dyaXRlX2VuZF9pbygpIikKPiA+IENjOiBzdGFibGVAa2VybmVsLm9yZwo+ID4gU2ln
bmVkLW9mZi1ieTogV2VuamllIFFpIDxxaXdlbmppZUB4aWFvbWkuY29tPgo+ID4gLS0tCj4gPiAg
ZnMvZjJmcy9jaGVja3BvaW50LmMgfCAyMCArKysrKysrKysrKysrKysrKystLQo+ID4gIGZzL2Yy
ZnMvZGF0YS5jICAgICAgIHwgMjUgKysrKysrKysrKysrKysrKystLS0tLS0tLQo+ID4gIDIgZmls
ZXMgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlm
ZiAtLWdpdCBhL2ZzL2YyZnMvY2hlY2twb2ludC5jIGIvZnMvZjJmcy9jaGVja3BvaW50LmMKPiA+
IGluZGV4IGMwMGE2YjZlYmNiZC4uYjE2ZDJkMzBlYzZhIDEwMDY0NAo+ID4gLS0tIGEvZnMvZjJm
cy9jaGVja3BvaW50LmMKPiA+ICsrKyBiL2ZzL2YyZnMvY2hlY2twb2ludC5jCj4gPiBAQCAtMTQ5
NywyNCArMTQ5Nyw0MCBAQCBzdGF0aWMgdm9pZCB1bmJsb2NrX29wZXJhdGlvbnMoc3RydWN0IGYy
ZnNfc2JfaW5mbyAqc2JpKQo+ID4gICAgICAgZjJmc191bmxvY2tfYWxsKHNiaSk7Cj4gPiAgfQo+
ID4KPiA+ICtzdGF0aWMgYm9vbCBmMmZzX3ByZXBhcmVfY3Bfd2FpdChzdHJ1Y3QgZjJmc19zYl9p
bmZvICpzYmksCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHdhaXRf
cXVldWVfZW50cnkgKndhaXQsIGludCB0eXBlKQo+ID4gK3sKPiA+ICsgICAgIHVuc2lnbmVkIGxv
bmcgZmxhZ3M7Cj4gPiArICAgICBib29sIHdhaXRfbW9yZTsKPiA+ICsKPiA+ICsgICAgIHByZXBh
cmVfdG9fd2FpdCgmc2JpLT5jcF93YWl0LCB3YWl0LCBUQVNLX1VOSU5URVJSVVBUSUJMRSk7Cj4g
PiArICAgICBzcGluX2xvY2tfaXJxc2F2ZSgmc2JpLT5jcF93YWl0LmxvY2ssIGZsYWdzKTsKPiA+
ICsgICAgIHdhaXRfbW9yZSA9IGdldF9wYWdlcyhzYmksIHR5cGUpOwo+ID4gKyAgICAgc3Bpbl91
bmxvY2tfaXJxcmVzdG9yZSgmc2JpLT5jcF93YWl0LmxvY2ssIGZsYWdzKTsKPiA+ICsKPiA+ICsg
ICAgIHJldHVybiB3YWl0X21vcmU7Cj4gPiArfQo+ID4gKwo+ID4gIHZvaWQgZjJmc193YWl0X29u
X2FsbF9wYWdlcyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGludCB0eXBlKQo+ID4gIHsKPiA+
ICAgICAgIERFRklORV9XQUlUKHdhaXQpOwo+ID4KPiA+ICAgICAgIGZvciAoOzspIHsKPiA+IC0g
ICAgICAgICAgICAgaWYgKCFnZXRfcGFnZXMoc2JpLCB0eXBlKSkKPiA+ICsgICAgICAgICAgICAg
aWYgKCFmMmZzX3ByZXBhcmVfY3Bfd2FpdChzYmksICZ3YWl0LCB0eXBlKSkKPiA+ICAgICAgICAg
ICAgICAgICAgICAgICBicmVhazsKPiA+Cj4gPiAgICAgICAgICAgICAgIGlmICh1bmxpa2VseShm
MmZzX2NwX2Vycm9yKHNiaSkgJiYKPiA+ICAgICAgICAgICAgICAgICAgICAgICAhaXNfc2JpX2Zs
YWdfc2V0KHNiaSwgU0JJX0lTX0NMT1NFKSkpCj4gPiAgICAgICAgICAgICAgICAgICAgICAgYnJl
YWs7Cj4gPiArICAgICAgICAgICAgIGZpbmlzaF93YWl0KCZzYmktPmNwX3dhaXQsICZ3YWl0KTsK
PiA+Cj4gPiAgICAgICAgICAgICAgIGlmICh0eXBlID09IEYyRlNfRElSVFlfTUVUQSkKPiA+ICAg
ICAgICAgICAgICAgICAgICAgICBmMmZzX3N5bmNfbWV0YV9wYWdlcyhzYmksIExPTkdfTUFYLCBG
U19DUF9NRVRBX0lPKTsKPiA+ICAgICAgICAgICAgICAgZWxzZSBpZiAodHlwZSA9PSBGMkZTX1dC
X0NQX0RBVEEpCj4gPiAgICAgICAgICAgICAgICAgICAgICAgZjJmc19zdWJtaXRfbWVyZ2VkX3dy
aXRlKHNiaSwgREFUQSk7Cj4gPgo+ID4gLSAgICAgICAgICAgICBwcmVwYXJlX3RvX3dhaXQoJnNi
aS0+Y3Bfd2FpdCwgJndhaXQsIFRBU0tfVU5JTlRFUlJVUFRJQkxFKTsKPiA+ICsgICAgICAgICAg
ICAgaWYgKCFmMmZzX3ByZXBhcmVfY3Bfd2FpdChzYmksICZ3YWl0LCB0eXBlKSkKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICBicmVhazsKPiA+ICAgICAgICAgICAgICAgaW9fc2NoZWR1bGVfdGlt
ZW91dChERUZBVUxUX1NDSEVEVUxFX1RJTUVPVVQpOwo+ID4gICAgICAgfQo+ID4gICAgICAgZmlu
aXNoX3dhaXQoJnNiaS0+Y3Bfd2FpdCwgJndhaXQpOwo+ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMv
ZGF0YS5jIGIvZnMvZjJmcy9kYXRhLmMKPiA+IGluZGV4IGQ4M2EyMTk5OGVjMi4uZDkyZjBiNzBi
YTJmIDEwMDY0NAo+ID4gLS0tIGEvZnMvZjJmcy9kYXRhLmMKPiA+ICsrKyBiL2ZzL2YyZnMvZGF0
YS5jCj4gPiBAQCAtMzkyLDE1ICszOTIsMjQgQEAgc3RhdGljIHZvaWQgZjJmc193cml0ZV9lbmRf
aW8oc3RydWN0IGJpbyAqYmlvKQo+ID4gICAgICAgICAgICAgICBpZiAoZjJmc19pbl93YXJtX25v
ZGVfbGlzdChmb2xpbykpCj4gPiAgICAgICAgICAgICAgICAgICAgICAgZjJmc19kZWxfZnN5bmNf
bm9kZV9lbnRyeShzYmksIGZvbGlvKTsKPiA+Cj4gPiAtICAgICAgICAgICAgIGRlY19wYWdlX2Nv
dW50KHNiaSwgdHlwZSk7Cj4gPiArICAgICAgICAgICAgIGlmICh0eXBlID09IEYyRlNfV0JfQ1Bf
REFUQSkgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4g
Pgo+ID4gLSAgICAgICAgICAgICAvKgo+ID4gLSAgICAgICAgICAgICAgKiB3ZSBzaG91bGQgYWNj
ZXNzIHNiaSBiZWZvcmUgZm9saW9fZW5kX3dyaXRlYmFjaygpIHRvCj4gPiAtICAgICAgICAgICAg
ICAqIGF2b2lkIHJhY2luZyB3LyBraWxsX2YyZnNfc3VwZXIoKQo+ID4gLSAgICAgICAgICAgICAg
Ki8KPiA+IC0gICAgICAgICAgICAgaWYgKHR5cGUgPT0gRjJGU19XQl9DUF9EQVRBICYmICFnZXRf
cGFnZXMoc2JpLCB0eXBlKSAmJgo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgd3Ff
aGFzX3NsZWVwZXIoJnNiaS0+Y3Bfd2FpdCkpCj4gPiAtICAgICAgICAgICAgICAgICAgICAgd2Fr
ZV91cCgmc2JpLT5jcF93YWl0KTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAvKgo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAqIEhvbGQgY3Bfd2FpdC5sb2NrIGFjcm9zcyB0aGUgemVybyB0
cmFuc2l0aW9uIGFuZCB0aGUKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgKiB3YWtldXAgc28g
ZjJmc193YWl0X29uX2FsbF9wYWdlcygpIGNhbm5vdCBtaXNzIGl0IG9yCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICogZnJlZSBzYmkgYmVmb3JlIHRoaXMgY2FsbGJhY2sgc3RvcHMgdG91Y2hp
bmcgY3Bfd2FpdC4KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgKi8KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICBpZiAoYXRvbWljX2RlY19hbmRfbG9ja19pcnFzYXZlKCZzYmktPm5yX3BhZ2Vz
W3R5cGVdLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgJnNiaS0+Y3Bfd2FpdC5sb2NrLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmxhZ3MpKSB7Cj4KPiAgICAgICAgICAgICAg
ICAgaWYgKGF0b21pY19kZWNfcmV0dXJuKCZzYmktPm5yX3BhZ2VzW3R5cGVdKSAmJgo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgd3FfaGFzX3NsZWVwZXIoJnNiaS0+Y3Bfd2FpdCnv
vIkKPiAgICAgICAgICAgICAgICAgICAgICAgICB3YWtlX3VwKCZzYmktPmNwX3dhaXQpOwo+Cj4g
SXMgaXQgZW5vdWdoIHRvIHNvbHZlIHRoZSBpc3N1ZT8KPgo+IFRoYW5rcywKPgo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgd2FrZV91cF9sb2NrZWQoJnNiaS0+Y3Bfd2FpdCk7Cj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZz
YmktPmNwX3dhaXQubG9jaywKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgZmxhZ3MpOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIH0KPiA+
ICsgICAgICAgICAgICAgfSBlbHNlIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBkZWNfcGFn
ZV9jb3VudChzYmksIHR5cGUpOwo+ID4gKyAgICAgICAgICAgICB9Cj4gPgo+ID4gICAgICAgICAg
ICAgICBmb2xpb19jbGVhcl9mMmZzX2djaW5nKGZvbGlvKTsKPiA+ICAgICAgICAgICAgICAgZm9s
aW9fZW5kX3dyaXRlYmFjayhmb2xpbyk7Cj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
