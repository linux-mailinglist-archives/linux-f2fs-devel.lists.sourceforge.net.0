Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Mte+DzaJRGoiwgoAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 01 Jul 2026 05:27:50 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 608A46E977F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 01 Jul 2026 05:27:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=WsNwyK5F;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=hJETz6dS;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=hOKl4IgB;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=Q1V57Rm+;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:google.com:reject}")
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/TuIX9iygEZv/x7iUp9raMx0Oq/nIQLgY4MtUEbfeJ0=; b=WsNwyK5FkURzJr7A87RllGCXfk
	mqiVs74XUpDEraTBfBP47HYV5sNzp56OVDGYh8dSDZ4IcAWscpFbIinQP29KeGjkkzc0BtI3OFhcW
	vbkQVu4aH7JLtpkj2itHt3QQPVfpFF+rx1d+dHSL4ho1u1zf9CUVAOGACyZvk5MmXpX0=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1welbN-0004GV-6c;
	Wed, 01 Jul 2026 03:27:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1welb8-0004Ew-LR
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 01 Jul 2026 03:26:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/m5Drnn29SrZM9qKZu3VRSTeAN3P5qvdiA/8UHh5wrw=; b=hJETz6dSIdczeLpcj58BfMwXeU
 +xObept54PkJUBkAoTcos02EXZkGnlKC4v/oPWoYiWrGu23LxEN/R+drZ1RbStr73KXsAXemrUqO6
 dv8Yh3f+LeUadh+n8bC7c9OSV/kQNn5JI+M06Lfl4XvHM/8hHxw4I6szvdku/pbIwUHU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/m5Drnn29SrZM9qKZu3VRSTeAN3P5qvdiA/8UHh5wrw=; b=hOKl4IgBKca8FksB8W1Nr06VBc
 SwWxC8k9rmyqnryTp2Pj+UFP8Q+y9kFBw829BSYIMM5dk/1+iB2M7Qinonkhz8wbhb+OkkW8viWgl
 dV2IeHByeivy/BIifC7s0mwkN10Nb8WVGVQYUskbc2yp2viFtSYXuIVAlFPZWMUqdjXo=;
Received: from mail-wr1-f47.google.com ([209.85.221.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1welb7-0001g2-A2 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 01 Jul 2026 03:26:51 +0000
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-473987fc217so16670f8f.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 30 Jun 2026 20:26:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782876388; cv=none;
 d=google.com; s=arc-20260327;
 b=VHVKUFGY29Q5OosdGVyGyJMS3U/nor8DJ2WpaOSUwS1D6XOMT0nhtN2CxTM8J+9qE6
 +A6YAQ5X091u2i8Tw4Wlf8tfE8ZM6Q01EcBlba+MKJb/nNY6pfwTvH52X+vKoWr1cOJF
 xYpOxgM2ZDzeJTc0j4QRLZzghANrv9r5JG2cVll+NR0qCoxhC4J+RnPHWup5uS30rB5Z
 tk62gHDI2Xza1y4baLyqu3KuRZOfvunShh7dBpavL/uhQahBqslS9R5MHr5mepLY6KoF
 6s+k5iwV7y3JztqTVXKZMe3cXc/bv+cls3BBhCkBINZ3I3Vh/U55rsiQ8k5QN5nCBJq8
 RcFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=/m5Drnn29SrZM9qKZu3VRSTeAN3P5qvdiA/8UHh5wrw=;
 fh=VPpaqAgbxHfFMUkULDHRsWtY3hFJN9P3DuuTGYVlMRY=;
 b=fyoCp6F4eQbw2JjC9lOeQlvsoGoQjnVWW8bgaJR2fycNd3e41MbtTOVHq9trhnRtho
 8xwQ7v+mmLCKZGRsKSnWuHJRP33C67ePsELKyGZWs3tzQXy1JDnGQjpCZaEwwZtZprDY
 3GVN6v1jaogH6scjOBeO+5p67BYFmC4un+SpRHM7rI9N6yU8p8MMxi6LGWZhCUs3+O4a
 KdpToU4LD9ppdzO8yNNqLgr48TC8pEx/k26Q2qeZmnDEaruNsnwRIzZDPiCmMbWPmRmZ
 3W19HuAFUDRj13uZeLJGnTDvjxf2oiX6Hiq//oo3knZC81GrA5BhZq+wOEuu7gq4H+gi
 R3zQ==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782876388; x=1783481188; darn=lists.sourceforge.net;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=/m5Drnn29SrZM9qKZu3VRSTeAN3P5qvdiA/8UHh5wrw=;
 b=Q1V57Rm+UU08hMP+ewsbDtT/Wh8YUtwzzUyNoZ5M5E++8Bluzycv0XQpuW1NWbv3d5
 W7duvI7UKT10bYz5KnEnjHdy4kU9VjQNfYlz/sA7fF/jpQMNYIpoo+bl112V0eEYVLt9
 ElCHSR7tUlKQFhI/580knRvA5UMEvuxCiQI0LDsNYrnWflshnDQel7K/PAZocr+8HHvA
 ZbyTO0grfBf61oA6ql+/RSp0l1c4YPiz9NwhYGxQJ1phJxTEnaMunvSDOMoDOhFll9iK
 xW3FFKz951jP3ytjpVXPaDLmVbHIxPq4ESxme7otDPd7UFdpVdBNIX2+3Zfw9AYwUyNF
 l7LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782876388; x=1783481188;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=/m5Drnn29SrZM9qKZu3VRSTeAN3P5qvdiA/8UHh5wrw=;
 b=XOkmJeIzIGVccUPPaO9+Zi12nfa5Tf3Rh745GwOLrDZLRU6jz/L65GaU8nX1wuSWCW
 A/LhImlPsNAx6Ic3aPxl7Dl1uXLTQtqxAyFLzRu0aN/UE6OsbtiHN8hnsbgdOp2I8xpR
 HvpZlnNb4DFdmlXR3nz5dtTe4syhGo0yzqMiT1Nn0rOiMNAn3RjTSXjVD3/E9URIuSdv
 BaB208lO13wT2EQ2x++hXzWCiKk7FY8s7maHUDnKLEY8TCAvnkCyprwwFHy02F6sCWKR
 lk/+F3QBk+AzHSn48R1+ETlCIqneWI3koO4dpMWk1wb7b07Y0mxnqaMlFK33hcSSb6dM
 zz5A==
X-Forwarded-Encrypted: i=1;
 AHgh+RrjYS2hK5I7hI0VnVopsxNgcF6OyQ/trlU4TWd8VoEhOO82xj85kSkvKDIFCfC2YZxClS/DDWuQuSWwiOXDJgTP@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxwDEkh9wzDls98XbPMfmOH/CMdl7L8kwnRrnRl4E2sDpOA9MOu
 VG2MF6f8OHcBai+80NxUQpm8v3PHBttyGesooeExD6c7Y/JGAMj/N7gsilm7uQloUuV+607+6v0
 73ew8REsrOOxp5W6njpfx45W+/T+BX5Y=
X-Gm-Gg: AfdE7cmA3NMsjUkfHu8ZbDd97AJQ8JgkwpXZMrrRWEjse+GJE+uqnQWQCSRA0Atg8uI
 tfa05LOFB+WQMj9zWOjhdyl7KSvgYLFCJbGyLfpcxMFT14sVehv6EzwPu0xQxBZLgc8yyGaELOn
 5dWrnUHNjw34ZW7paUpghvKUVY6G/vu6JjmFB2ktvVqUcvJ5iK4mlrXkOU2P5BBV9ra15SSyoOk
 JHCNz9jhB+f2bqLR2j5xh4LeWam3emeMUT1QKa2W/dhcxhSJClDmX3pnayGsAW7IFXHZvEBig==
X-Received: by 2002:a05:6000:25c5:b0:474:77c4:b6d8 with SMTP id
 ffacd0b85a97d-475522be0a4mr5229890f8f.3.1782876388314; Tue, 30 Jun 2026
 20:26:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260629114918.224537-1-chao@kernel.org>
 <CAHJ8P3LOBs0gWHM7rT-G51tQ7Q+utn_xupnp2BuBir+cAC-Xiw@mail.gmail.com>
 <5ad89199-f5e8-43a7-971a-575ff27c1d40@kernel.org>
In-Reply-To: <5ad89199-f5e8-43a7-971a-575ff27c1d40@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Wed, 1 Jul 2026 11:26:17 +0800
X-Gm-Features: AVVi8CeTN-iEgs4Gmn-vLUSffffFMA5_G_I7nwp9FMIIF0nKdiugxXSJsVTM7YU
Message-ID: <CAHJ8P3JFP6bdGfmHruanPFNgtHz8J7FYj0A1To7+iDpcsxzOaA@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu 于2026年6月30日周二 19:02写道： > > On 6/30/26
    16:50, Zhiguo Niu wrote: > > Chao Yu via Linux-f2fs-devel > > 于2026年6月29日周一
    19:52写道： > >> > >> Blocks of pinfile m [...] 
 
 Content analysis details:   (0.1 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
                             digit
                             [niuzhiguo84(at)gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail provider
                             [niuzhiguo84(at)gmail.com]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.47 listed in wl.mailspike.net]
X-Headers-End: 1welb7-0001g2-A2
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid potential
 section-unaligned pinfile
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 stable@kernel.org, linux-kernel@vger.kernel.org,
 Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.09 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:stable@kernel.org,m:linux-kernel@vger.kernel.org,m:daehojeong@google.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[niuzhiguo84@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niuzhiguo84@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 608A46E977F

Q2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI25bm0NuaciDMw5pel5ZGo5LqMIDE5OjAy
5YaZ6YGT77yaCj4KPiBPbiA2LzMwLzI2IDE2OjUwLCBaaGlndW8gTml1IHdyb3RlOgo+ID4gQ2hh
byBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCA8bGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vm
b3JnZS5uZXQ+Cj4gPiDkuo4yMDI25bm0NuaciDI55pel5ZGo5LiAIDE5OjUy5YaZ6YGT77yaCj4g
Pj4KPiA+PiBCbG9ja3Mgb2YgcGluZmlsZSBtYXkgbm90IGFsaWduZWQgdG8gc2VjdGlvbiBzaXpl
IGR1ZSB0byB3cm9uZyB1c2UKPiA+PiBvbiBwaW5maWxlLCByZXN1bHQgaW4gaGVhdnkgb3Zlcmhl
YWQgb2YgR0MsIGxldCBhdm9pZCB0aGlzIGJ5Cj4gPj4gYWRkaW5nIGFkZGl0aW9uYWwgY2hlY2sg
Y29uZGl0aW9uIGluIGYyZnNfc2V0YXR0cigpLgo+ID4+Cj4gPj4gLSB0cnVuY2F0ZSAtcyA4bWIg
cGluZmlsZQo+ID4+IDogcmFuZG9tIGNoZWNrcG9pbnQgbWF5IHBlcnNpc3QgZmlsZXNpemUgdy8g
aW5vZGUKPiA+PiAtIGZhbGxvY2F0ZSAtbyAwIC1sIDhtYiBwaW5maWxlCj4gPj4gIC0gZjJmc19m
YWxsb2NhdGUKPiA+PiAgIC0gZjJmc19leHBhbmRfaW5vZGVfZGF0YQo+ID4+ICAgIC0gZjJmc19h
bGxvY2F0ZV9waW5uaW5nX3NlY3Rpb24KPiA+PiAgICAtIGYyZnNfbWFwX2Jsb2Nrcwo+ID4+ICAg
ICAtIGYyZnNfbWFwX2xvY2sKPiA+PiAgICAgLSBfX2FsbG9jYXRlX2RhdGFfYmxvY2sKPiA+PiAg
ICAgLSBmaWxlX25lZWRfdHJ1bmNhdGUKPiA+PiAgICAgOiB3LyBGQURWSVNFX1RSVU5DX0JJVCwg
d2UgY2FuIGV4cGVjdCB1bmFsaWduZWQgbWFwcGluZyBjYW4gYmUKPiA+PiAgICAgICB0cnVuY2F0
ZWQgd2hpbGUgb3BlbigpIGlmIGYyZnMgaXMgbm90IHVtb3VudCBhYm5vcm1hbGx5Cj4gPj4gICAg
IC0gZjJmc19tYXBfdW5sb2NrCj4gPj4gICAgIDogZm9sbG93aW5nIGYyZnMgY2hlY2twb2ludCBh
bmQgc3VkZGVuIHBvd2VyLWN1dAo+ID4+Cj4gPj4gLSBtb3VudAo+ID4+IC0gb3BlbiBwaW5maWxl
Cj4gPj4gIC0gZjJmc19maWxlX29wZW4KPiA+PiAgIC0gZmluaXNoX3ByZWFsbG9jYXRlX2Jsb2Nr
cwo+ID4+ICAgIC0gdHJ1bmNhdGVfc2V0c2l6ZQo+ID4+ICAgIDogZmlsZXNpemUgaXMgOG1iCj4g
Pj4gICAgLSBmMmZzX3RydW5jYXRlCj4gPj4gICAgOiBjYW4gb25seSB0cnVuY2F0ZSBibG9jayBv
dXRzaWRlIGZpbGVzaXplLCByYXRoZXIgdGhhbiB0cnVuY2F0aW5nCj4gPj4gICAgICB1bmFsaWdu
ZWQgYmxvY2tzIGluc2lkZSBmaWxlc2l6ZQo+ID4gSGkgQ2hhbywKPiA+IDhNQiBpcyBzZWN0aW9u
IGFsaW5nZWQgd2hlbiBmYWxsb2NhdGVkIGJ5IGYyZnNfYWxsb2NhdGVfcGlubmluZ19zZWN0aW9u
Pz8KPiA+IHNvIEhvdyBjb3VsZCB0aGVyZSBhcmUgdW5hbGlnbmVkIGJsb2NrcyBpbnNpZGUgZmls
ZXNpemU/Cj4KPiBaaGlndW8sCj4KPiBBcyBwYXJ0aWFsIGJsa2FkZHJzIHdlcmUgcGVyc2lzdGVk
IGFuZCByZWNvdmVyZWQsIHNlZSBjb21tZW50cyBhcm91bmQKPiBmMmZzX21hcF91bmxvY2soKS4K
Pgo+ID4+Cj4gPj4gRml4ZXM6IGY1YTUzZWRjZjAxZSAoImYyZnM6IHN1cHBvcnQgYWxpZ25lZCBw
aW5uZWQgZmlsZSIpCj4gPj4gQ2M6IHN0YWJsZUBrZXJuZWwub3JnCj4gPj4gQ2M6IERhZWhvIEpl
b25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4gPj4gU2lnbmVkLW9mZi1ieTogQ2hhbyBZdSA8
Y2hhb0BrZXJuZWwub3JnPgo+ID4+IC0tLQo+ID4+ICBmcy9mMmZzL2ZpbGUuYyB8IDI4ICsrKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0KPiA+PiAgMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlv
bnMoKyksIDExIGRlbGV0aW9ucygtKQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZmls
ZS5jIGIvZnMvZjJmcy9maWxlLmMKPiA+PiBpbmRleCBmNGZhY2Q0MDlkOWIuLjExY2M4ZDc5YzIz
NSAxMDA2NDQKPiA+PiAtLS0gYS9mcy9mMmZzL2ZpbGUuYwo+ID4+ICsrKyBiL2ZzL2YyZnMvZmls
ZS5jCj4gPj4gQEAgLTExMDcsMTcgKzExMDcsMjMgQEAgaW50IGYyZnNfc2V0YXR0cihzdHJ1Y3Qg
bW50X2lkbWFwICppZG1hcCwgc3RydWN0IGRlbnRyeSAqZGVudHJ5LAo+ID4+ICAgICAgICAgICAg
ICAgICAgICAgICAgICFJU19BTElHTkVEKGF0dHItPmlhX3NpemUsCj4gPj4gICAgICAgICAgICAg
ICAgICAgICAgICAgRjJGU19CTEtfVE9fQllURVMoZmktPmlfY2x1c3Rlcl9zaXplKSkpCj4gPj4g
ICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gPj4gLSAgICAgICAgICAg
ICAgIC8qCj4gPj4gLSAgICAgICAgICAgICAgICAqIFRvIHByZXZlbnQgc2NhdHRlcmVkIHBpbiBi
bG9jayBnZW5lcmF0aW9uLCB3ZSBkb24ndCBhbGxvdwo+ID4+IC0gICAgICAgICAgICAgICAgKiBz
bWFsbGVyL2VxdWFsIHNpemUgdW5hbGlnbmVkIHRydW5jYXRpb24gZm9yIHBpbm5lZCBmaWxlLgo+
ID4+IC0gICAgICAgICAgICAgICAgKiBXZSBvbmx5IHN1cHBvcnQgb3ZlcndyaXRlIElPIHRvIHBp
bm5lZCBmaWxlLCBzbyBkb24ndAo+ID4+IC0gICAgICAgICAgICAgICAgKiBjYXJlIGFib3V0IGxh
cmdlciBzaXplIHRydW5jYXRpb24uCj4gPj4gLSAgICAgICAgICAgICAgICAqLwo+ID4+IC0gICAg
ICAgICAgICAgICBpZiAoZjJmc19pc19waW5uZWRfZmlsZShpbm9kZSkgJiYKPiA+PiAtICAgICAg
ICAgICAgICAgICAgICAgICBhdHRyLT5pYV9zaXplIDw9IGlfc2l6ZV9yZWFkKGlub2RlKSAmJgo+
ID4+IC0gICAgICAgICAgICAgICAgICAgICAgICFJU19BTElHTkVEKGF0dHItPmlhX3NpemUsCj4g
Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgRjJGU19CTEtfVE9fQllURVMoQ0FQX0JMS1NfUEVS
X1NFQyhzYmkpKSkpCj4gPj4gLSAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7
Cj4gPj4gKwo+ID4+ICsgICAgICAgICAgICAgICBpZiAoZjJmc19pc19waW5uZWRfZmlsZShpbm9k
ZSkpIHsKPiA+PiArICAgICAgICAgICAgICAgICAgICAgICAvKgo+ID4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAqIEl0IG1heSBicmVhayBzZWN0aW9uLWFsaWduZWQgZmFsbG9jYXRlIHJlY292
ZXJ5Cj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICogbWVjaGFuaXNtLCBzbyBkbyBub3Qg
YWxsb3cgbGFyZ2VyIHNpemUgdHJ1bmNhdGlvbi4KPiA+PiArICAgICAgICAgICAgICAgICAgICAg
ICAgKi8KPiA+PiArICAgICAgICAgICAgICAgICAgICAgICBpZiAoYXR0ci0+aWFfc2l6ZSA+IGlf
c2l6ZV9yZWFkKGlub2RlKSkKPiA+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJl
dHVybiAtRUlOVkFMOwo+ID4gSXMgaXQgb2sgaWYgd2UgYWxsb3cgbGFyZ2VyIHNpemUgdHJ1bmNh
dGlvbiBhbmQgYWxzbyAgbGltaXQgaXQgdG8KPiA+IGFsaWduZWQgIkYyRlNfQkxLX1RPX0JZVEVT
KENBUF9CTEtTX1BFUl9TRUMoc2JpKSI/Cj4KPiBObywgSSB0aGluayBhYm92ZSBleGFtcGxlIHdp
bGwgc3RpbGwgc3VmZmVyIHNlY3Rpb24tdW5hbGlnbmVkIGlzc3VlLgo+Cj4gVGhhbmtzLApIaSBD
aGFvLApnb3QgaXQgYW5kIHRoYW5rcyBmb3IgeW91ciBleHBsYWluYXRpb24sIHNvClJldmlld2Vk
LWJ5OiBaaGlndW8gTml1IDx6aGlndW8ubml1QHVuaXNvYy5jb20+CnRoYW5rcyEKCj4KPiA+IHRo
YW5rcyEKPiA+PiArICAgICAgICAgICAgICAgICAgICAgICAvKgo+ID4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAqIFRvIHByZXZlbnQgc2NhdHRlcmVkIHBpbiBibG9jayBnZW5lcmF0aW9uLCB3
ZSBkb24ndAo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgICAqIGFsbG93IHNtYWxsZXIvZXF1
YWwgc2l6ZSB1bmFsaWduZWQgdHJ1bmNhdGlvbiBmb3IKPiA+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgKiBwaW5uZWQgZmlsZS4KPiA+PiArICAgICAgICAgICAgICAgICAgICAgICAgKi8KPiA+
PiArICAgICAgICAgICAgICAgICAgICAgICBlbHNlIGlmICghSVNfQUxJR05FRChhdHRyLT5pYV9z
aXplLAo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRjJGU19CTEtfVE9fQllU
RVMoQ0FQX0JMS1NfUEVSX1NFQyhzYmkpKSkpCj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+PiArICAgICAgICAgICAgICAgfQo+ID4+ICAgICAg
ICAgfQo+ID4+Cj4gPj4gICAgICAgICBpZiAoaXNfcXVvdGFfbW9kaWZpY2F0aW9uKGlkbWFwLCBp
bm9kZSwgYXR0cikpIHsKPiA+PiAtLQo+ID4+IDIuNDkuMAo+ID4+Cj4gPj4KPiA+Pgo+ID4+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPj4gTGludXgt
ZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiA+PiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJj
ZWZvcmdlLm5ldAo+ID4+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3Rp
bmZvL2xpbnV4LWYyZnMtZGV2ZWwKPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMt
ZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0
L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
