Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IlzKl/gBGqAQAIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 May 2026 22:34:39 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8E353A7F7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 May 2026 22:34:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6aL0kicvaVvqRYQHoJ/CBCu3zCH/jRWDACteupIXyUI=; b=K2tsMRnSyFWNbJXO6vmnM4aG52
	bj5+HcfaZlfFwc2CZKC0vTVBeuvDszQcySmZ/Vv78+yrn2kaIOHT8W0XUJbsDVIIOhRf0KxGLFr/O
	gGSImjTas9MfsPRXuf20gkHt3XUYtlijd7TkkMlPiPDWl+IaGP+rE6VDZUvmSGUSPXBE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wNGHj-0002cV-Jp;
	Wed, 13 May 2026 20:34:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <smfrench@gmail.com>) id 1wNGHi-0002cJ-SX
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 May 2026 20:34:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YffvRc4ueiaHAv5vxRd/K/yTD1qBPNZn3LhENW3N4xg=; b=OGygpoyAtGKUhKO8iGiLooDN6r
 PHLUCzGYsysnvn+SrAuyINB95uoY2oLv4DuSWfo2imMJFIElaa2yfdDCZRuPouy4Qv63Dlswekhp6
 kN0CjbOpbtSPbNVq36mLowi5WWlOleIViJz4AW41miBP1yB2z1h+RrguR9SKMMup+mKs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YffvRc4ueiaHAv5vxRd/K/yTD1qBPNZn3LhENW3N4xg=; b=kAbmQVl8w7gFvwMxoTXDMKs4MB
 zI3w/oiG2KznbiYIxm6t+NtrHqWmqjZkbAHY0y6LEU3cH82MUqLyM2XF0AP3rR9Z8D9VUZIBF8kZr
 d1oSAeRqRWtnfrcl6NcDz1g83ZOczo5Yd6FtFWuy4yklt3L9oOZ1exxZ120YQYjKtuOc=;
Received: from mail-qv1-f49.google.com ([209.85.219.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wNGHh-0004Lv-LI for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 May 2026 20:34:27 +0000
Received: by mail-qv1-f49.google.com with SMTP id
 6a1803df08f44-8b4298d271fso115185686d6.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 13 May 2026 13:34:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778704455; cv=none;
 d=google.com; s=arc-20240605;
 b=cm8CpYZeRTlgomE6VNQRGrgDR32gvFK3aksFwmrohtXtR2h9waEYSRTQN8sbOHMVCd
 afC/WAxzGfhmNMwp1wVqmpeXS8dpWB31s4Bm8QEhzjWY2RcO9PPE8qnBBn68jV8Zq+WK
 5up3EIk1D/WLfHDJtT8lIW+I0Q+lgWfHE1x2z/I7tVIYC8uEcKmSuqA0BGM5tsrFltjX
 zequIoqHQGYdgG3jgkj6Bvn+DpvVRIfckLTaQ3SBHrU6OZnBzARl+mL1nX8abb5tdmqL
 pau7X7DIFfxE2b3bK+T5ttjjnJwYlqzcnUJafYRmC86yGDYTPK8zLOMD5D5EdblKgY5I
 A9Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=YffvRc4ueiaHAv5vxRd/K/yTD1qBPNZn3LhENW3N4xg=;
 fh=YzrB6ZFbk91qRV7U/+i6crfI25oDW8oMNsMsOPB/Xnc=;
 b=HmFyAoS0Oho6CGzVDfOVefYW/bYLNRH7fDlCxV2NNmZJT7pSedEftN6kY7P90vLl/k
 P5hfbHOPZ8MSMHaG6L3zWjzRmN2xXzfMG+nG9MGThnxaUsczJCWPf0HDsRJZpdGZr04n
 lQT5DsE1AlyORVB2QpphdKq34TZLfBZn7W//wnRbuVsb0pd56eE98sRifle6x2GxmkQA
 mGyIDZOB0gecO4VWkAZkdzth9vAV0/dPAA1auWrlfnRMZFwoe8x3qY7FJCEbRamgmDLQ
 SPu5Fz2BOBgiD6tIB6Eyi0A2SBVN+r89kK3cINpIR/+WgDhGPMS/48cDks7m7ha2m2HX
 K6lw==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778704455; x=1779309255; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YffvRc4ueiaHAv5vxRd/K/yTD1qBPNZn3LhENW3N4xg=;
 b=en4KopnLtsPghyN08j2qlkiysuRs0DlEQLzoAPnhUrnnj/y4h3sYoOQM53MrN07Nxb
 pb/n7dgynXL/WQ3asJrGNvnUFN4xt/ug0TNWzLwsyrXdfih6eFeIPy7IAC6CJ7BS3E7v
 UHacwZpIoOTlY+5g1lz42Lrk3TzMi/b5bejU415iA3jGC8GE7FYKt2r+XW7gnBNahl+1
 2y9c8GRh3Mrk18QhPths1Eup8uJeU48Jaqktad15wISNYmxkP05pt5SMrNEG8Q9FaLXn
 Mx0hxsC06mstHR2RQoaGyOnnlg/GPVsDTZYJL+3lxOWytP6/g0WRiwJMjKGDvLGYpnDI
 eA2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778704455; x=1779309255;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YffvRc4ueiaHAv5vxRd/K/yTD1qBPNZn3LhENW3N4xg=;
 b=Tn7UlfSp4XQ0e9nlWD6p7STKPpu+fPQJeyIQzpvk3qEoGgmThvUyww4YrayVZrRXCY
 zvVxIQZl3u2ZsgWi2m51I5Bb7qgy1kPdcMCJrl34FHj7qEArWDmTO9Uqa3qhQu7WUNQg
 nIA4bhSesJgcMjDqD7kJruziuWwXcPtqRm7p6xqHX6M2nzNniLwZNB2gvw/FhTiJMjo8
 IIwq9tvbn1XpopRiXS1+fBkQGlGxlydpRiIs5wCjJHjAyKYg336I837kqP0G0JVADVx4
 Gg0W0wmlXseXgwixulD72GVc/biYSK9DrQ8ser22mvolJ6gaOZbggBjOfmqTSqGsW9oq
 uX6g==
X-Forwarded-Encrypted: i=1;
 AFNElJ/mc2xuZsq08fpM1AFfmtZ2GMT2vFSZia3U/A4CzS8FfPpL+iGrzmudL4M4LNmv1fOZQiyoWjklNbBrV+gty16K@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yxa0D3KAmXRf+ZHKym1HX+YGGzPUzj8UYxc2o9NhOmF2OC9Qo/+
 v5UkXhZ8rE7d7V/E99/lTDZs15cEdIqutGkI117gL8Ge2IsoQAexdQLkMql7H93lD2fuy9ae9EA
 V55MTcNkijt4Jy7QMj9iN4qhYHAHderg=
X-Gm-Gg: Acq92OEhGCswGblDmYe20ZDaYzNfNj6hNhFmUXJmKmxgA+xA4fqkwyzQeyp3EpBOTOd
 nolS8p/XybDaknfYribwSa+o1sPeaHakgAOOSpvOXW45WK1foQDdOLVtUeBrgXC2QAF4VENgsg8
 R2/qW6ON4Z4VR0TLLBxw2MdHM5fhehjP/X4uowV8euIEniI4Kgye26d542Vb3COo4LL9wdEO976
 5ujJtKLp1IRVbCUMUb/1MsM6Ne6YfM3ePpFQe8viVlM25aXC6roHfZ4NbMp4u1vFoi+DD29TL6c
 CYXrsnL31IoKv1xUcYG8BaVfIBFRtHng2+LN/E6GGeY9RSE0YEbigQaKbFc7LBvZlPwZVnZfRn3
 9v9ttSdel0Fztl4LQlihWiPwDVQKjYUFcpRQ6IW9i3tvA/v24b79JppeGGw5BynHClhma8f6rYV
 d0rJutGtDCIOdaipiyM6P9zA==
X-Received: by 2002:a05:6214:8009:b0:8a0:846e:8850 with SMTP id
 6a1803df08f44-8c7b9d6a34dmr79395336d6.20.1778704455206; Wed, 13 May 2026
 13:34:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260512053625.2950900-1-hch@lst.de>
In-Reply-To: <20260512053625.2950900-1-hch@lst.de>
From: Steve French <smfrench@gmail.com>
Date: Wed, 13 May 2026 15:34:03 -0500
X-Gm-Features: AVHnY4LdSaGvyovg6RvG5pKhPWnEZkoZnNgrzQdw3V-htIBym1ah9EOHikjxM8Q
Message-ID: <CAH2r5msnYVb3hhXHwqDVHGGC1h4E6mLCRS4ktCrQoD9zdUW81g@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: I just tried this on 7.1-rc3 with the swap patches (full
 kernel
 build, on Ubuntu 25,10) and boot failed with out of memory which I had never
 seen before. Any idea how to workaround this with the swap [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [smfrench(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.49 listed in wl.mailspike.net]
X-Headers-End: 1wNGHh-0004Lv-LI
Subject: Re: [f2fs-dev] improve the swap_activate interface
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
Cc: Paulo Alcantara <pc@manguebit.org>, linux-doc@vger.kernel.org,
 "Darrick J . Wong" <djwong@kernel.org>, Carlos Maiolino <cem@kernel.org>,
 Hyunchul Lee <hyc.lee@gmail.com>, linux-mm@kvack.org,
 Naohiro Aota <naohiro.aota@wdc.com>, linux-xfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, Namjae Jeon <linkinjeon@kernel.org>,
 Chris Li <chrisl@kernel.org>, linux-nfs@vger.kernel.org,
 linux-block@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Kairui Song <kasong@tencent.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-cifs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Steve French <sfrench@samba.org>, linux-btrfs@vger.kernel.org,
 Anna Schumaker <anna@kernel.org>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Trond Myklebust <trondmy@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: DA8E353A7F7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:pc@manguebit.org,m:linux-doc@vger.kernel.org,m:djwong@kernel.org,m:cem@kernel.org,m:hyc.lee@gmail.com,m:linux-mm@kvack.org,m:naohiro.aota@wdc.com,m:linux-xfs@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linkinjeon@kernel.org,m:chrisl@kernel.org,m:linux-nfs@vger.kernel.org,m:linux-block@vger.kernel.org,m:dlemoal@kernel.org,m:dsterba@suse.com,m:jaegeuk@kernel.org,m:axboe@kernel.dk,m:brauner@kernel.org,m:kasong@tencent.com,m:tytso@mit.edu,m:linux-cifs@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:sfrench@samba.org,m:linux-btrfs@vger.kernel.org,m:anna@kernel.org,m:linux-fsdevel@vger.kernel.org,m:akpm@linux-foundation.org,m:trondmy@kernel.org,m:hyclee@gmail.com,s:lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[smfrench@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	FREEMAIL_CC(0.00)[manguebit.org,vger.kernel.org,kernel.org,gmail.com,kvack.org,wdc.com,suse.com,kernel.dk,tencent.com,mit.edu,lists.sourceforge.net,samba.org,linux-foundation.org];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[smfrench@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:email,mail.gmail.com:mid,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim]
X-Rspamd-Action: no action

SSBqdXN0IHRyaWVkIHRoaXMgb24gNy4xLXJjMyB3aXRoIHRoZSBzd2FwIHBhdGNoZXMgKGZ1bGwg
a2VybmVsIGJ1aWxkLApvbiBVYnVudHUgMjUsMTApIGFuZCBib290IGZhaWxlZCB3aXRoIG91dCBv
ZiBtZW1vcnkgd2hpY2ggSSBoYWQgbmV2ZXIKc2VlbiBiZWZvcmUuICBBbnkgaWRlYSBob3cgdG8g
d29ya2Fyb3VuZCB0aGlzIHdpdGggdGhlIHN3YXAgcGF0Y2gKc2VyaWVzLCBvciBpcyB0aGVyZSBh
IGZpeCBmb3IgdGhpcyBpbiB0aGUgc3dhcCBzZXJpZXMgYWxyZWFkeT8KCk9uIFR1ZSwgTWF5IDEy
LCAyMDI2IGF0IDEyOjQx4oCvQU0gQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+IHdyb3Rl
Ogo+Cj4gSGkgYWxsLAo+Cj4gRGFycmljayByZWNlbnRseSBwb3N0ZWQgaW9tYXAgc3VwcG9ydCBm
b3IgZnVzZS1pb21hcCwgd2hpY2ggd2FzIHRyaXZpYWwKPiBidXQgYSBiaXQgdWdseSwgd2hpY2gg
dHJpZ2dlcmVkIG1lIGludG8gbG9va2luZyBob3cgdGhpcyBjb3VsZCBiZSBkb25lCj4gaW4gYSBj
bGVhbmVyIHdheS4gIFRoZSByZXN1bHQgb2YgdGhhdCBpcyB0aGlzIGZhaXJseSBiaWcgc2VyaWVz
IHRoYXQKPiByZXdvcmtzIGhvdyB0aGUgTU0gY29kZSBjYWxscyBpbnRvIHRoZSBmaWxlIHN5c3Rl
bSB0byBhY3RpdmF0ZSBzd2FwCj4gZmlsZXMgdG8gbWFrZSBpdCBtdWNoIGNsZWFuZXIgYW5kIGVh
c2llciB0byB1c2UuCj4KPiBJJ3ZlIHRlc3RlZCB0aGlzIHdpdGggc3dhcCBkZXZpY2VzIG1hbnVh
bGx5LCBhbmQgdXNpbmcgdGhlIHN3YXAgdGVzdHMKPiBpbiB4ZnN0ZXN0cyBvbiBidHJmcywgZXh0
MywgZXh0NCwgZjJmcyBhbmQgeGZzIHRvIGV4ZXJjaXNlIHRoZSBkaWZmZXJlbnQKPiBpbXBsZW1l
bnRhdGlvbi4gIE91dCBvZiB0aG9zZSBhbGwgcGFzc2VkLCBidXQgZjJmcyBhY3R1YWxseSBub3Ry
dW5zIGFsbAo+IHRlc3RzIGV2ZW4gaW4gdGhlIGJhc2VsaW5lIGFzIGl0IHJlcXVpcmVzIHNwZWNp
YWwgcHJlcGFyYXRpb24gZm9yCj4gc3dhcGZpbGVzIHdoaWNoIG5ldmVyIGdvdCB3aXJlZCB1cCBp
biB4ZnN0ZXN0cy4KPgo+IERpZmZzdGF0Ogo+ICBEb2N1bWVudGF0aW9uL2ZpbGVzeXN0ZW1zL2lv
bWFwL29wZXJhdGlvbnMucnN0IHwgICAgMwo+ICBEb2N1bWVudGF0aW9uL2ZpbGVzeXN0ZW1zL2xv
Y2tpbmcucnN0ICAgICAgICAgIHwgICAzNSArLS0KPiAgRG9jdW1lbnRhdGlvbi9maWxlc3lzdGVt
cy92ZnMucnN0ICAgICAgICAgICAgICB8ICAgNDAgKystLQo+ICBibG9jay9mb3BzLmMgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxNSArCj4gIGZzL2J0cmZzL2J0cmZzX2lu
b2RlLmggICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAzCj4gIGZzL2J0cmZzL2ZpbGUuYyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICA0Cj4gIGZzL2J0cmZzL2lub2RlLmMg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDcyIC0tLS0tLS0KPiAgZnMvZXh0NC9m
aWxlLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDYKPiAgZnMvZXh0NC9p
bm9kZS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMTEgLQo+ICBmcy9mMmZz
L2RhdGEuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA1MCAtLS0tLQo+ICBm
cy9mMmZzL2YyZnMuaCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgMgo+ICBm
cy9mMmZzL2ZpbGUuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgNAo+ICBm
cy9pb21hcC9zd2FwZmlsZS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDE2NSArKyst
LS0tLS0tLS0tLS0tLS0KPiAgZnMvbmZzL2RpcmVjdC5jICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAgIDEKPiAgZnMvbmZzL2ZpbGUuYyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAgMjEgLS0KPiAgZnMvbmZzL25mczRmaWxlLmMgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAgIDMKPiAgZnMvbnRmcy9hb3BzLmMgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAgIDgKPiAgZnMvbnRmcy9maWxlLmMgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAgIDYKPiAgZnMvc21iL2NsaWVudC9jaWZzZnMuYyAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAgMTggKwo+ICBmcy9zbWIvY2xpZW50L2NpZnNmcy5oICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgICAgMwo+ICBmcy9zbWIvY2xpZW50L2ZpbGUuYyAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgICAxNiAtCj4gIGZzL3hmcy94ZnNfYW9wcy5jICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgIDQ4IC0tLS0tCj4gIGZzL3hmcy94ZnNfZmlsZS5jICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgIDM5ICsrKysKPiAgZnMvem9uZWZzL2ZpbGUuYyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMzAgKy0tCj4gIGluY2x1ZGUvbGludXgvZnMu
aCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDExIC0KPiAgaW5jbHVkZS9saW51eC9p
b21hcC5oICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDUKPiAgaW5jbHVkZS9saW51eC9u
ZnNfZnMuaCAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDMKPiAgaW5jbHVkZS9saW51eC9z
d2FwLmggICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxMjkgKy0tLS0tLS0tLS0tLS0KPiAg
bW0vcGFnZV9pby5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNDUgLS0t
LQo+ICBtbS9zd2FwLmggICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA5
MiArKysrKysrKysrCj4gIG1tL3N3YXBmaWxlLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgMjI3ICsrKysrKysrKysrKysrLS0tLS0tLS0tLS0KPiAgMzEgZmlsZXMgY2hhbmdl
ZCwgNDcxIGluc2VydGlvbnMoKyksIDY0NCBkZWxldGlvbnMoLSkKPgoKCi0tIApUaGFua3MsCgpT
dGV2ZQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNl
Zm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xp
bnV4LWYyZnMtZGV2ZWwK
