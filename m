Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YPFBHoY3OWrrogcAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jun 2026 15:24:22 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F4C6AFD02
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jun 2026 15:24:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b="MwHOSG/h";
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=MFlhMjwb;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=N2CQ+08J;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=lYnWzOOf;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:google.com:reject}")
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T0kKH/MmVx0MzFqY67cswdOSCANQgUaArZkQZwu6qCY=; b=MwHOSG/hpPL7DSaQAHTm3L5Xag
	9sJhQCAu1hRYSKVA+ulhBJQv9bv1UbpXtI3LVweKYpQiAYgkTNfUka204f6bTcSbWOgsOsi2rlrsP
	+FuuSF79V8PDPxmJ9fFLtaI2ghE/3FsccfuXYcfTwe27LiGYHviZNfX0L6BfKalcidjs=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wbedB-0000j5-SA;
	Mon, 22 Jun 2026 13:24:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1wbed9-0000ic-Ui
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jun 2026 13:24:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rU+oHCPcXn9BhjAvef88TGQxC669FX2Q4BW71gODPzw=; b=MFlhMjwb9DaEAl/4j2wVtdxKWO
 SLe5CYx67u6CjDZUHLYKA6toNgw97Tt+/UsHMVd7S+tV3X4C5oXZsjJRsgSaAsTMhRT4kBzGO8xZm
 U4kaZa6izKhHBsfg7R9lgi6vJY6PQ+vvARRQ2qEWqfJfgwIaX2Dl7C2S14uiQp+AqcKk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rU+oHCPcXn9BhjAvef88TGQxC669FX2Q4BW71gODPzw=; b=N2CQ+08JUgKKWB7e7pmaH29E0D
 MF7KsGJhNzaGLXx48xiOGuhZVuA4VuZ4bGYtMm7r2IT955OPsw8lMkRFe5hbHOR1qnxWXTQBFlqxu
 7aXv0jdmhpp83YoPfvpffmsF85cGgeqr55ovJ4PQkgm+dH8hvcymhGI1ieHOYlfcoN1g=;
Received: from mail-lf1-f51.google.com ([209.85.167.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wbed8-0000cE-RB for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jun 2026 13:24:04 +0000
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5ad583dc38eso3563734e87.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 22 Jun 2026 06:24:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782134636; cv=none;
 d=google.com; s=arc-20240605;
 b=BoZvxJtWWehfYA5vdNuFn1OgzQOqTxlDc5x/8gQP/Oe1z6hd/yV0wMLvaaUcStdfZd
 pBt4WgYyM+Src47mGbwAoe7+OM46RcfNghlqVpU8/V4Q/+9EjjEk3mWTQTQYAabOeX6A
 xtWIJMfJXk7ZcIVcs8OyR7/KgcJ64IiivhG24RB6/u56eH/pZB9Xx1suuo2tDEDqKA4C
 qWt8CdGtn5TerY1/kkVB4T88/wuF422aMdTQfHifNbRErqDhhbnaegZ2TFuaYFah84u6
 Nd16fXKWyFtrDeb/X/q5IauyzrtYROY9GNijAesZcZ/ZlRKRIbWaXVEoAhtLLNl98JAv
 mufg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=rU+oHCPcXn9BhjAvef88TGQxC669FX2Q4BW71gODPzw=;
 fh=xcEE8yJyhNtBTB8ZLP5EOF2U/LJPxS+oNTAhvtBIUQY=;
 b=N0qVMOB75eGqr0F/3K9bBzXky7lgG2yXNlyW3y1PyOdOYmXl8jTMcjgcf/ER+DLODm
 L2ALePiKqyO3J/AFDo6eAd0evnlAPQdpkbWW1wT5vt2uKu5Lh2mIKkO16yshZksj/Hwk
 oqw1G2TnbpIpnm8ZOBYEA2PsBaTrqf2e1rZnWawMLznTcQAMmTdZVMImKVqpHXqU9ErF
 0pOZEETD62cBK3t0xXYYbd0TWds7m7+W2zpM8/WH1UzvuA55DpkDjRclpCvfRNG2hYU7
 9W/+bUYmHraWMPv6QNPE9VCXnXDLNe68QIk6zp4ZEQ5UtAckUTCnb5B99PF/qYEEdrg5
 miaw==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782134636; x=1782739436; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rU+oHCPcXn9BhjAvef88TGQxC669FX2Q4BW71gODPzw=;
 b=lYnWzOOf5Nth+AtuROTfLhQDs8efyuWy056EDzhEIrDcmayBimnzVmRKWOhrUcIJ6b
 HOqegjMQo6bkQNUfXn53vxbWJmjdW0NlND/9TwsdDIQ+icdLgUB7kK8OpkARB5t/DK5b
 zF6JdAyiERZm/swzUmSPZX+LMlZFQve1YIYtQqcQ4zGfmMO0HAaNLPURVH6h3zqlcFqt
 AqScgVlSe074zHFdVK0YhfrqTL6iIZ8BeqCOzNxRuFa/cwnUM6JGAIFD5CpnB5bhczPs
 Ext3paqRteUQHXM8rK2AgC0HYGhwWa9KlPRk86HciNhZdJsTgYjMBlQ/UzgVXW37mBuJ
 YBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782134636; x=1782739436;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rU+oHCPcXn9BhjAvef88TGQxC669FX2Q4BW71gODPzw=;
 b=Wz/vaWHcqfPRLGq6nytWGtCkG2RhzUiZLCjz2J0ryobrpxipWAoUohStawR2c1rjjM
 AN1pk2mUa1WCn4B7HqwJNS9zPqMdPLeSle5Ove6jqwYQd6Up1dQ+FHDVdLlODR+mxgL8
 oh4GWlV3h6AMyYFuwMFU2+DYlVa87GmJnooY1biDkysqVSZz1+omvJ8sZd/HQAdTF8CH
 02uoO+ZJQ54BIh5Ed+HpEUBWh/x1c9mUTuVdH2oEVhM4z5Y0975bm3tQHqeaVP1UDalV
 E0qH0Y6YdRKhB5Jbp6QQi06iFm/Lz3WIYSfIghQW8uhx12DW8Hg16PX1YxFnufW7n8A9
 q+qw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/iRE7HQ8NyIIou8iXFgOJU8Nx/7FSxn5xvqomqimverEqq7Fqz57aNTaZchzByiTWGBgbwWgJuvuEGXQcBHl2m@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyarpvPNQBuzJS4R9O6ySofWxVF6U8f70ziicKpxoJ0uCuQH6mt
 5Sz4eKjAGqqKSZeNoG7VZTtP/2sVkKYTFYr6revaTDEL9R+EnNS6jCnzkd/Tj+/4ozV3O2SdqYT
 7ZqPgtxUDMLo50KE6PPQ1yNhJTd5mVRI=
X-Gm-Gg: AfdE7cnswBqsTjeVJodvvteWui7LhGjQ8oEqRSAE+s8taAqXdREfx4SwBRwNbDW6l3a
 t7+xGd5wffiwNpEwO8PaQBNI01pq+ytou41vJWQWi7IhwwctY8fZqVSgQvJYginlsMkJIG61GS+
 OfP2vtz5uPfAyoo119z19gOlz99q0oa/m8cIlnmoqiW3IfETGr9sReqC8udtw8z376i1JL4mlkB
 T99RjVekxgx2/0K3y1SkPggXD2iT+uMjor2Xk5MNcUAVxW94+2wup0PsSKR6Qov4+br7Fa7gQ==
X-Received: by 2002:a05:6512:2c99:b0:5ad:4f16:2af8 with SMTP id
 2adb3069b0e04-5ad576e171emr3796648e87.16.1782134636131; Mon, 22 Jun 2026
 06:23:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260618100503.2601790-1-qiwenjie@xiaomi.com>
 <4354654f-3aca-40a8-bc88-23e540ee5aec@kernel.org>
In-Reply-To: <4354654f-3aca-40a8-bc88-23e540ee5aec@kernel.org>
From: Wenjie Qi <qwjhust@gmail.com>
Date: Mon, 22 Jun 2026 21:23:43 +0800
X-Gm-Features: AVVi8CdwS8_Q5RTN8GidR2JIEHPajLBKvISYeuzADxiGJrCeQOFsijQNHvGKnR4
Message-ID: <CAGFpFsQoZSB_YiCrJcZ31OiFtCFi03rSHKbxP7qArRFvH++FPw@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The UAF scenario described in v1/v2 does not look valid.
 The wakeup is already before folio_end_writeback(), and I do not see enough
 basis to claim that sbi->cp_wait can be freed at that point. After your
 comments, 
 v3-v7 drifted to a different issue: using the post-decrement count to avoid
 missing the zero transition when another F2FS_WB_CP_DATA writeback is
 submitted before the second get_ [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [qwjhust(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.51 listed in wl.mailspike.net]
X-Headers-End: 1wbed8-0000cE-RB
Subject: Re: [f2fs-dev] [PATCH v7] f2fs: use post-decrement count for
 cp_wait wakeup
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
Cc: geoo115@gmail.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, qiwenjie@xiaomi.com,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.09 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:geoo115@gmail.com,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:qiwenjie@xiaomi.com,m:jaegeuk@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.sourceforge.net,xiaomi.com,kernel.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 93F4C6AFD02

ICBUaGUgVUFGIHNjZW5hcmlvIGRlc2NyaWJlZCBpbiB2MS92MiBkb2VzIG5vdCBsb29rIHZhbGlk
LiBUaGUgd2FrZXVwIGlzCiAgYWxyZWFkeSBiZWZvcmUgZm9saW9fZW5kX3dyaXRlYmFjaygpLCBh
bmQgSSBkbyBub3Qgc2VlIGVub3VnaCBiYXNpcyB0bwogIGNsYWltIHRoYXQgc2JpLT5jcF93YWl0
IGNhbiBiZSBmcmVlZCBhdCB0aGF0IHBvaW50LgoKICBBZnRlciB5b3VyIGNvbW1lbnRzLCB2My12
NyBkcmlmdGVkIHRvIGEgZGlmZmVyZW50IGlzc3VlOiB1c2luZyB0aGUKICBwb3N0LWRlY3JlbWVu
dCBjb3VudCB0byBhdm9pZCBtaXNzaW5nIHRoZSB6ZXJvIHRyYW5zaXRpb24gd2hlbiBhbm90aGVy
CiAgRjJGU19XQl9DUF9EQVRBIHdyaXRlYmFjayBpcyBzdWJtaXR0ZWQgYmVmb3JlIHRoZSBzZWNv
bmQgZ2V0X3BhZ2VzKCkKICBjaGVjay4gVGhhdCBpcyBub3QgdGhlIHNhbWUgaXNzdWUgYXMgdGhl
IHYxL3YyIFVBRiBkZXNjcmlwdGlvbi4KCiAgUGxlYXNlIGRyb3AgdGhpcyBwYXRjaC4gSWYgeW91
IHRoaW5rIHRoZSB3YWtldXAtbGF0ZW5jeSBpc3N1ZSBpcwpzdGlsbCB3b3J0aCBmaXhpbmcKICBz
ZXBhcmF0ZWx5LCBJIGNhbiBzZW5kIGEgbmV3IHBhdGNoIHdpdGhvdXQgdGhlIFVBRiB3b3JkaW5n
LCBGaXhlcwp0YWcsIG9yIHN0YWJsZSBDYy4KCiAgVGhhbmtzLAoKT24gU2F0LCBKdW4gMjAsIDIw
MjYgYXQgMzo1N+KAr1BNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiA2
LzE4LzI2IDE4OjA1LCBXZW5qaWUgUWkgd3JvdGU6Cj4gPiBmMmZzX3dyaXRlX2VuZF9pbygpIGRl
Y3JlbWVudHMgdGhlIHdyaXRlYmFjayBwYWdlIGNvdW50ZXIgYW5kIHRoZW4gcmVhZHMKPiA+IGl0
IGFnYWluIHdpdGggZ2V0X3BhZ2VzKCkgdG8gZGVjaWRlIHdoZXRoZXIgdGhlIGxhc3QgRjJGU19X
Ql9DUF9EQVRBCj4gPiBjb21wbGV0aW9uIHNob3VsZCB3YWtlIGNwX3dhaXQuCj4gPgo+ID4gVGhh
dCBzZWNvbmQgcmVhZCBjYW4gbWlzcyB0aGUgemVybyB0cmFuc2l0aW9uIGFzIGJlbG93Ogo+Cj4g
TG9va3MgY29tbWVudHMgb2YgdjcgcGF0Y2ggaXMgcXVpdGUgZGlmZmVyZW50IGZyb20gdGhlIG9u
ZSBvZiB2MSBwYXRjaD8KPgo+IFF1b3RlZCBmcm9tIHYxOgo+Cj4gImYyZnNfd3JpdGVfZW5kX2lv
KCkgY3VycmVudGx5IGRlY3JlbWVudHMgdGhlIHdyaXRlYmFjayBwYWdlIGNvdW50ZXIgYmVmb3Jl
Cj4gd2FraW5nIHNiaS0+Y3Bfd2FpdCBmb3IgdGhlIGxhc3QgRjJGU19XQl9DUF9EQVRBIGNvbXBs
ZXRpb24uCj4KPiBUaGF0IGRlY3JlbWVudCBjYW4gZHJvcCB0aGUgRjJGU19XQl9DUF9EQVRBIGNv
dW50IHRvIHplcm8uIEl0IGNhbiB1bmJsb2NrCj4gYSBjb25jdXJyZW50IHVubW91bnQgcGF0aCB3
YWl0aW5nIGluIGYyZnNfd2FpdF9vbl9hbGxfcGFnZXMoKS4gVW5tb3VudCBjYW4KPiBjb250aW51
ZSB0aHJvdWdoIGYyZnNfcHV0X3N1cGVyKCkgYW5kIGV2ZW50dWFsbHkgZnJlZSBzYmkgd2hpbGUg
dGhlIGVuZF9pbwo+IGNhbGxiYWNrIGlzIHN0aWxsIGFib3V0IHRvIGV2YWx1YXRlIHdxX2hhc19z
bGVlcGVyKCkgYW5kIHdha2VfdXAoKSBvbgo+IHNiaS0+Y3Bfd2FpdC4KPgo+IENvbW1pdCAyZDlj
NGE0ZWQ0ZWUgKCJmMmZzOiBmaXggVUFGIGNhdXNlZCBieSBkZWNyZW1lbnRpbmcgc2JpLT5ucl9w
YWdlc1tdCj4gaW4gZjJmc193cml0ZV9lbmRfaW8oKSIpIGZpeGVkIG9uZSBwb3N0LWRlY3JlbWVu
dCBzYmkgYWNjZXNzIGJ5IG1vdmluZyB0aGUKPiB3YXJtLW5vZGUtbGlzdCBoYW5kbGluZyBiZWZv
cmUgZGVjX3BhZ2VfY291bnQoKS4gVGhlIGNvbXByZXNzZWQgd3JpdGViYWNrCj4gcGF0aCBmb2xs
b3dzIHRoZSBzYW1lIHJ1bGUgYW5kIGRvY3VtZW50cyB0aGF0IGRlY19wYWdlX2NvdW50KCkgbXVz
dCBiZSB0aGUKPiBsYXN0IGFjY2VzcyB0byBzYmkgd2hlbiBpdCBjYW4gZHJvcCBGMkZTX1dCX0NQ
X0RBVEEgdG8gemVyby4KPgo+IEFwcGx5IHRoZSBzYW1lIG9yZGVyaW5nIHJ1bGUgdG8gdGhlIGNw
X3dhaXQgd2FrZXVwLiBDaGVjayB3aGV0aGVyIHRoaXMgaXMKPiB0aGUgbGFzdCBGMkZTX1dCX0NQ
X0RBVEEgY29tcGxldGlvbiBhbmQgd2FrZSB0aGUgd2FpdGVyIGJlZm9yZSB0aGUgY291bnRlcgo+
IGRlY3JlbWVudC4gVGhlbiB0aGUgY2FsbGJhY2sgbm8gbG9uZ2VyIGRlcmVmZXJlbmNlcyBzYmkt
PmNwX3dhaXQgYWZ0ZXIgdGhlCj4gbGlmZXRpbWUgYm91bmRhcnkuIEEgd2FpdGVyIHRoYXQgcnVu
cyBiZWZvcmUgdGhlIGRlY3JlbWVudCBtYXkgb2JzZXJ2ZSBvbGQKPiBjb3VudCBhbmQgc2xlZXAg
dW50aWwgdGhlIG9uZS1qaWZmeSB0aW1lb3V0LCBidXQgY29ycmVjdG5lc3Mgbm8gbG9uZ2VyCj4g
ZGVwZW5kcyBvbiB0b3VjaGluZyBzYmkgYWZ0ZXIgdGhlIGNvdW50ZXIgcmVhY2hlcyB6ZXJvLiIK
Pgo+IEkgbWF5IGZvdW5kIHNvbWV0aGluZyBpbnRlcmVzdGluZzogdjcgY29kZXMgdHJ5IHRvIGZp
eCBVQUYgYnVnIGRlc2NyaWJlZCBpbgo+IHYxIGNvbW1lbnQsIGhvd2V2ZXIgdjcgY29tbWVudCB0
cmllcyB0byBleHBsYWluIHdoYXQgdjIgY29kZXMgd2FudCB0byBkby4KPgo+IEkgc3VzcGVjdCB5
b3VyIExMTSBnb2VzIGFub3RoZXIgZGlyZWN0aW9uIGFmdGVyIHByb21wdGVkIHcvIG15IGNvbW1l
bnRzIG9uCj4gcGF0Y2ggdjE/IExldCBtZSBrbm93IEknbSB3cm9uZy4gOlAKPgo+IFRoYW5rcywK
Pgo+ID4KPiA+IGNoZWNrcG9pbnQgICAgICAgICAgZW5kX2lvIEEgICAgICAgICAgICAgIHN1Ym1p
dHRlciBCCj4gPiAtIGYyZnNfd2FpdF9vbl9hbGxfcGFnZXMKPiA+ICAgLSBnZXRfcGFnZXMoKSA+
IDAKPiA+ICAgLSBwcmVwYXJlX3RvX3dhaXQoY3Bfd2FpdCkKPiA+ICAgLSBpb19zY2hlZHVsZV90
aW1lb3V0Cj4gPiAgICAgICAgICAgICAgICAgICAgICAtIGYyZnNfd3JpdGVfZW5kX2lvCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgLSBkZWNfcGFnZV9jb3VudAo+ID4gICAgICAgICAgICAgICAg
ICAgICAgICA6IGNvdW50IDEgLT4gMAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgLSBmMmZzX3N1Ym1pdF9wYWdlX3dyaXRlCj4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgLSBpbmNfcGFnZV9jb3VudAo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA6IGNvdW50IDAgLT4gMQo+ID4gICAg
ICAgICAgICAgICAgICAgICAgIC0gZ2V0X3BhZ2VzKCkgPiAwCj4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICA6IHNraXAgd2FrZV91cChjcF93YWl0KQo+ID4KPiA+IFRoZSBjaGVja3BvaW50IHRo
cmVhZCBjYW4gdGhlbiBrZWVwIHNsZWVwaW5nIHVudGlsCj4gPiBERUZBVUxUX1NDSEVEVUxFX1RJ
TUVPVVQsIGV2ZW4gdGhvdWdoIGVuZF9pbyBBIGNvbXBsZXRlZCB0aGUgb2xkIGxhc3QKPiA+IEYy
RlNfV0JfQ1BfREFUQSBwYWdlLgo+ID4KPiA+IFVzZSB0aGUgcG9zdC1kZWNyZW1lbnQgdmFsdWUg
Zm9yIEYyRlNfV0JfQ1BfREFUQSBjb21wbGV0aW9ucyBzbyB0aGUgd2FrZXVwCj4gPiBkZWNpc2lv
biBpcyB0aWVkIHRvIHRoaXMgY29tcGxldGlvbi4gIEtlZXAgdGhlIGV4aXN0aW5nIGRlY19wYWdl
X2NvdW50KCkKPiA+IHBhdGggZm9yIG90aGVyIHdyaXRlYmFjayBjb3VudGVycy4KPiA+Cj4gPiBG
aXhlczogZTIzNDA4ODc1OGZjICgiZjJmczogYXZvaWQgd2FpdCBpZiBJTyBlbmQgdXAgd2hlbiBk
b19jaGVja3BvaW50IGZvciBiZXR0ZXIgcGVyZm9ybWFuY2UiKQo+ID4gRml4ZXM6IGNlMjczOWU0
ODJiYyAoImYyZnM6IGZpeCB0byBhdm9pZCBVQUYgaW4gZjJmc193cml0ZV9lbmRfaW8oKSIpCj4g
PiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+ID4gU2lnbmVkLW9mZi1ieTogV2VuamllIFFp
IDxxaXdlbmppZUB4aWFvbWkuY29tPgo+ID4gLS0tCj4gPiAgIGZzL2YyZnMvZGF0YS5jIHwgMTIg
KysrKysrKy0tLS0tCj4gPiAgIGZzL2YyZnMvZjJmcy5oIHwgIDYgKysrKysrCj4gPiAgIDIgZmls
ZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZm
IC0tZ2l0IGEvZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEuYwo+ID4gaW5kZXggZDgzYTIx
OTk4ZWMyLi4yYWZkY2QyMDlkNTQgMTAwNjQ0Cj4gPiAtLS0gYS9mcy9mMmZzL2RhdGEuYwo+ID4g
KysrIGIvZnMvZjJmcy9kYXRhLmMKPiA+IEBAIC0zOTIsMTUgKzM5MiwxNyBAQCBzdGF0aWMgdm9p
ZCBmMmZzX3dyaXRlX2VuZF9pbyhzdHJ1Y3QgYmlvICpiaW8pCj4gPiAgICAgICAgICAgICAgIGlm
IChmMmZzX2luX3dhcm1fbm9kZV9saXN0KGZvbGlvKSkKPiA+ICAgICAgICAgICAgICAgICAgICAg
ICBmMmZzX2RlbF9mc3luY19ub2RlX2VudHJ5KHNiaSwgZm9saW8pOwo+ID4KPiA+IC0gICAgICAg
ICAgICAgZGVjX3BhZ2VfY291bnQoc2JpLCB0eXBlKTsKPiA+IC0KPiA+ICAgICAgICAgICAgICAg
LyoKPiA+ICAgICAgICAgICAgICAgICogd2Ugc2hvdWxkIGFjY2VzcyBzYmkgYmVmb3JlIGZvbGlv
X2VuZF93cml0ZWJhY2soKSB0bwo+ID4gICAgICAgICAgICAgICAgKiBhdm9pZCByYWNpbmcgdy8g
a2lsbF9mMmZzX3N1cGVyKCkKPiA+ICAgICAgICAgICAgICAgICovCj4gPiAtICAgICAgICAgICAg
IGlmICh0eXBlID09IEYyRlNfV0JfQ1BfREFUQSAmJiAhZ2V0X3BhZ2VzKHNiaSwgdHlwZSkgJiYK
PiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIHdxX2hhc19zbGVlcGVyKCZzYmktPmNw
X3dhaXQpKQo+ID4gLSAgICAgICAgICAgICAgICAgICAgIHdha2VfdXAoJnNiaS0+Y3Bfd2FpdCk7
Cj4gPiArICAgICAgICAgICAgIGlmICh0eXBlID09IEYyRlNfV0JfQ1BfREFUQSkgewo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgIGlmICghZGVjX3BhZ2VfY291bnRfcmV0dXJuKHNiaSwgdHlwZSkg
JiYKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgd3FfaGFzX3NsZWVwZXIoJnNiaS0+Y3Bf
d2FpdCkpCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICB3YWtlX3VwKCZzYmktPmNw
X3dhaXQpOwo+ID4gKyAgICAgICAgICAgICB9IGVsc2Ugewo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgIGRlY19wYWdlX2NvdW50KHNiaSwgdHlwZSk7Cj4gPiArICAgICAgICAgICAgIH0KPiA+Cj4g
PiAgICAgICAgICAgICAgIGZvbGlvX2NsZWFyX2YyZnNfZ2NpbmcoZm9saW8pOwo+ID4gICAgICAg
ICAgICAgICBmb2xpb19lbmRfd3JpdGViYWNrKGZvbGlvKTsKPiA+IGRpZmYgLS1naXQgYS9mcy9m
MmZzL2YyZnMuaCBiL2ZzL2YyZnMvZjJmcy5oCj4gPiBpbmRleCA5ZjI0Mjg3ZGU0YzMuLmRiNzUw
Y2VmMzcxZCAxMDA2NDQKPiA+IC0tLSBhL2ZzL2YyZnMvZjJmcy5oCj4gPiArKysgYi9mcy9mMmZz
L2YyZnMuaAo+ID4gQEAgLTI3NzYsNiArMjc3NiwxMiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgZGVj
X3BhZ2VfY291bnQoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBpbnQgY291bnRfdHlwZSkKPiA+
ICAgICAgIGF0b21pY19kZWMoJnNiaS0+bnJfcGFnZXNbY291bnRfdHlwZV0pOwo+ID4gICB9Cj4g
Pgo+ID4gK3N0YXRpYyBpbmxpbmUgaW50IGRlY19wYWdlX2NvdW50X3JldHVybihzdHJ1Y3QgZjJm
c19zYl9pbmZvICpzYmksCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGludCBjb3VudF90eXBlKQo+ID4gK3sKPiA+ICsgICAgIHJldHVybiBhdG9taWNfZGVjX3JldHVy
bigmc2JpLT5ucl9wYWdlc1tjb3VudF90eXBlXSk7Cj4gPiArfQo+ID4gKwo+ID4gICBzdGF0aWMg
aW5saW5lIHZvaWQgaW5vZGVfZGVjX2RpcnR5X3BhZ2VzKHN0cnVjdCBpbm9kZSAqaW5vZGUpCj4g
PiAgIHsKPiA+ICAgICAgIGlmICghU19JU0RJUihpbm9kZS0+aV9tb2RlKSAmJiAhU19JU1JFRyhp
bm9kZS0+aV9tb2RlKSAmJgo+ID4KPiA+IGJhc2UtY29tbWl0OiBjMGI2NWY2MTI5YzdmYmI1MjZl
OTIxZGQ2MDI2MTY1MGYxYjJiZWY5Cj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZz
LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5l
dC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
