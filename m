Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNYNKlnRu2k4owIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Mar 2026 11:35:05 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD942C98AC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Mar 2026 11:35:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BkizvWmGQbAC+P1Iz4qbFxjSpJJ5H1PceHmiSxdqby8=; b=ciMWNK7D1gFY92rUOXC8A+Qo85
	1m0wUj9kKY3vw0K1RVat3J+5J2zt2px8i7K4JemgD97g6qD5NJ9H+a6YVmqXE/4tOu0C40C2w/o55
	WWolHtibf9KZPJgvvSlmDprzn47fAz7855CfXCn/jmBM6Tezx0Fwgy9wuFaKQIVWDLPE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w3AiL-0001Sl-GV;
	Thu, 19 Mar 2026 10:34:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <gality369@gmail.com>) id 1w3AiJ-0001Sf-Gb
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Mar 2026 10:34:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1u01jNvDsCaxllwQeIn5uc/G8Bi9UfpQM8KXwq2965s=; b=bkQwbEi2gffDn8feSqgLuiKIMv
 0KqBS/W99H07Ux0Xn3nIzRGLVjjEDIWbBc8CbAg3hldFDDGLM9VN++hZ1I4bJzulB+W7S5SlXmuIu
 0Az/oBMOYmeJ5WVGyguPRlAVdMwgy03ITuLku5UdtTRQ7CY0bg+KWBk7UVFpRodZLh8c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1u01jNvDsCaxllwQeIn5uc/G8Bi9UfpQM8KXwq2965s=; b=nTNLYZzDI82wZDavuOGfHgIXIg
 1ZLrORvbTyU5+8paXmYncfbYjfnNAHVrNh+WxPXa1B73YrgaT03ZubeviRMcwfYImaEzb5T4ZjiVf
 lL25+iKhLDVE0QWtqlQJJoCENfnolW7eV3jsWYelbRV/5TjCJhwgovUVs2oTx9Ewy868=;
Received: from mail-ed1-f48.google.com ([209.85.208.48])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1w3AiJ-0006gS-3B for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Mar 2026 10:34:51 +0000
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-66847de014aso963718a12.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 19 Mar 2026 03:34:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773916479; cv=none;
 d=google.com; s=arc-20240605;
 b=DbkYGsMmdwOviSchLtk+XV2Ojao8vqOqeWg1RyBRajBVclA+zxH3/Ajc3xXzxYvqXI
 7cidxLGN89VOXXcEr+62wcQBn4+rY0/dFCacWBB2OB8RzEJ5Jlbv6uO58vWlBk8pU8hM
 p24H40m/FId0wUwBOB1Wiwcu6ekIW/AUKNnTXWj2mTvP5vskU7SydSofCmcVGR5mcgah
 INaABvPnBnXMQ9d+8wXQkUtPClEVBKOSbUQPOOOZE9bw6/fFd/9u1QJAVh0jYmsGl8BY
 FZqAE1zbX7FR/wwKFiFQVGGH504V4RUP5kjQ0tkuvFT88jy/xcwYG/OagiATHFZq7KDt
 k0sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=1u01jNvDsCaxllwQeIn5uc/G8Bi9UfpQM8KXwq2965s=;
 fh=7rhXUnvrBrDekq08lBoFZ0zcy9RURBtyXZVzhzp6XVc=;
 b=RdcV/Ik9wIMLZQV+mNf//VWsNVLzTGNkzSi+ml2oH9L7039UZvga5aA2v6aIEk5XUT
 CHaCgcXQDi7w6UtYrbr0Tmr8DIiPeV4Gew7zrvn8dSyoMVJ6qwBm8ydkZoLw6G9tw2Yl
 eEGSjg2p/HUwbu24EVrbYdPUErksaCb2TGqiHhvTJxLdlarlbsuQlcKz+B9n0Devc11O
 jk36InW2BZp4ta5J6enZ9oHF2oJ70riv+JQ8WpXNNkMMgMxU6TLa0FTsfVbg6E8Z3qdC
 6ZJDif84N/yJ73W3Ul4I9Gr1084fpOnJVA/QjsqsVB9pNzBla4N98QyMJaG0BnyJDupC
 r9CQ==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773916479; x=1774521279; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1u01jNvDsCaxllwQeIn5uc/G8Bi9UfpQM8KXwq2965s=;
 b=HGysZ9+LdWoFOIsEnpGeKL+QKAgtOZW7ur2QRXuk6UrRi6E/rb6TkuCz3aAmHOrtLy
 ot1+ssMpZ3PxSth7SY0BTkNor6i0rJpwfueFOUZ4CN/+Jpr6d+tqi60tjq4zjmlHtgXq
 1e+YXGxVLB9v1ur+zQ3aQSD/7OfVDQn1NXM1ohrgxjfreX2OocHlJoKvl6tM1HXv7n3z
 ZEjDnSNRlcfL3kSRH3KbCskt7CM5Kq4B+YRhwy9WAZYlg2bQE6GQrGfowXvIaeNUy9Zf
 CGSUBZbmYZwUsWuaCP+TYrj5JHHjO4P3PackBgbmjh1BJRZgTgJxH/gcZK1p16y0m2/V
 yUQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773916479; x=1774521279;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1u01jNvDsCaxllwQeIn5uc/G8Bi9UfpQM8KXwq2965s=;
 b=jWzmaclY9GZfC4aBZbXgtUYNTiX5d91hNglb1qXRihB1to2FJJvbK8OxqoSY1Qb9fz
 Hw+SR8gAkF5QXAwZrfh9f5xYD4jDav2AAmRweVbU5dyRRmmGvmG1jf3DW6eH7duZ6UEJ
 wtVLg/MGqNVVrq2JbnBQhPGDtztIlx1FOOhG1roqwLUsd3vj+9vid8iA5PlNV89pqmKy
 becsasTJLnL8/51T25Ju7885yQxBJHsVMRcIY6RwRbmpAz6DgTDQXY7DXOgrXBQ7QTVZ
 KS95POy1bZbKxuaKPGZI7iXUOmsYT4kePG3dGvBqmnDy/KDfsT06mQsM2YHcjCLNncva
 1Xtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtMDb0Lr9kHVHln17IyRLryx1l6zyi4uq7dOBQUqpFMYu7u+Te6zjGxQ8exUsgsDRKpdmWsKBPPrA0q2u2avUY@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxMk2PlaQEUdKl09tnr21a8LaML2JqIlm4b7BlRukYC5GpMh0w3
 xVL7iKieJMHyfhct1FycRoZ8OASzSNgLC/Tm65M3PwhtXtCCY2Cgb6RrdwfmiRWHC6zF5r1Ii31
 dcOiuZ3Jat9lhbfEFi7jfQdfZ4iBw70s=
X-Gm-Gg: ATEYQzw7LO2fr6YJHZvXNKI5GCwg//TCLwz7ub9F7vcX8EqakyAK0z/I/maTRtqbIh1
 1+XDg506EnT8aOyyyJo2X/nvtz8l8CfdEiGp0RiH90z1u2Faff3HHrDhWM4EugEabLFzcZj0UJA
 XCFMrwt8CGNlPjBE7jPI/vowhwMbSBk7qtG4ahGCdEgiPBJtFzn40CL659gd6VJTB82FD5yGaG2
 71jub/hHr/jnaXR+Jh4ZKWZlL6pEhewzYTvvtB72zX9Bf/0slje7FP0cJj+GzqTuy4sRzkxmp89
 45qKNcWoVuJER8i9Qu8UJYpDipTCnUZcWV2k/nbFSfcMRuxRKbjh59c=
X-Received: by 2002:a05:6402:5207:b0:668:73b9:b934 with SMTP id
 4fb4d7f45d1cf-66873b9bb4amr709044a12.26.1773916479208; Thu, 19 Mar 2026
 03:34:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260318090410.3368669-1-gality369@gmail.com>
 <2026031816-numbing-unsorted-f21d@gregkh>
In-Reply-To: <2026031816-numbing-unsorted-f21d@gregkh>
From: ZhengYuan Huang <gality369@gmail.com>
Date: Thu, 19 Mar 2026 18:34:26 +0800
X-Gm-Features: AaiRm533DqpzCizscL_2_xUNigMmQdLY4GBR7jb7922bmx5QEOOGR8eIcfgpQbY
Message-ID: <CAOmEq9W54=JSD6DmZC3xObqRodvWi_V8YZDqOxHd99kHSyvz7g@mail.gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Mar 18, 2026 at 7:39 PM Greg KH wrote: > Does the
 f2fs fsck tool catch this issue when run on the corrupted > image? This issue
 was found by our fuzzing tool. We are still minimizing the reproducer and
 checking whether fsck.f2fs catches this case, so that part is not concluded
 yet. I would appreciate a bit more time [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 ARC_SIGNED             Message has a ARC signature
 0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [gality369(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [gality369(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.48 listed in wl.mailspike.net]
X-Headers-End: 1w3AiJ-0006gS-3B
Subject: Re: [f2fs-dev] [PATCH] f2fs: reject non-directory inode in
 f2fs_get_parent() to prevent null-ptr-deref
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
Cc: cm224.lee@samsung.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, baijiaju1990@gmail.com,
 zzzccc427@gmail.com, r33s3n6@gmail.com, jaegeuk@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [0.09 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[gality369@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:cm224.lee@samsung.com,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:baijiaju1990@gmail.com,m:zzzccc427@gmail.com,m:r33s3n6@gmail.com,m:jaegeuk@kernel.org,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20230601];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-0.984];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gality369@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[samsung.com,vger.kernel.org,lists.sourceforge.net,gmail.com,kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,mail.gmail.com:mid,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: DCD942C98AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gV2VkLCBNYXIgMTgsIDIwMjYgYXQgNzozOeKAr1BNIEdyZWcgS0ggPGdyZWdraEBsaW51eGZv
dW5kYXRpb24ub3JnPiB3cm90ZToKPiBEb2VzIHRoZSBmMmZzIGZzY2sgdG9vbCBjYXRjaCB0aGlz
IGlzc3VlIHdoZW4gcnVuIG9uIHRoZSBjb3JydXB0ZWQKPiBpbWFnZT8KClRoaXMgaXNzdWUgd2Fz
IGZvdW5kIGJ5IG91ciBmdXp6aW5nIHRvb2wuIFdlIGFyZSBzdGlsbCBtaW5pbWl6aW5nIHRoZQpy
ZXByb2R1Y2VyIGFuZCBjaGVja2luZyB3aGV0aGVyIGZzY2suZjJmcyBjYXRjaGVzIHRoaXMgY2Fz
ZSwgc28gdGhhdApwYXJ0IGlzIG5vdCBjb25jbHVkZWQgeWV0LiBJIHdvdWxkIGFwcHJlY2lhdGUg
YSBiaXQgbW9yZSB0aW1lIG9uIHRoYXQuCgo+IFRoYXQgaXMgbm90IGEgdmFsaWQgdGhyZWF0IG1v
ZGVsLCBzb3JyeS4gIElmIHlvdSBjYW4gbW9kaWZ5IGEgZmlsZXN5c3RlbQo+IGltYWdlIHdoaWxl
IGl0IGlzIG1vdW50ZWQsIHRoaXMgaXMgdGhlIGxlYXN0IG9mIHlvdXIgd29ycmllcyA6KQoKVGhh
bmsgeW91IHZlcnkgbXVjaCBmb3IgdGFraW5nIHRoZSB0aW1lIHRvIHJldmlldyB0aGUgcmVwb3J0
IGFuZCBmb3IKeW91ciByZXBseS4gSSByZWFsbHkgYXBwcmVjaWF0ZSBpdC4KCkkgdW5kZXJzdGFu
ZCB5b3VyIHBvaW50IGFib3V0IHJ1bnRpbWUgY29ycnVwdGlvbiBub3QgbmVjZXNzYXJpbHkgYmVp
bmcKdGhlIHByaW1hcnkgdGhyZWF0IG1vZGVsLiBJIGp1c3Qgd2FudGVkIHRvIHByb3ZpZGUgYSBi
aXQgbW9yZSBjb250ZXh0Cm9uIHdoeSBJIHRob3VnaHQgdGhpcyBjYXNlIG1pZ2h0IHN0aWxsIGJl
IHdvcnRoIHJlcG9ydGluZy4KCk91ciBmdXp6aW5nIHRvb2wgZG9lcyBub3QgYWltIHRvIG1vZGVs
IGFuIGF0dGFja2VyIHdpdGggYXJiaXRyYXJ5CndyaXRlIGFjY2VzcyB0byBhIG1vdW50ZWQgZmls
ZXN5c3RlbSBpbWFnZS4gV2hhdCBpdCBkb2VzIGlzIGFwcGx5CnNtYWxsIG1ldGFkYXRhIG11dGF0
aW9ucyBkdXJpbmcgcnVudGltZSBpbiBvcmRlciB0byB0ZXN0IGZpbGVzeXN0ZW0Kcm9idXN0bmVz
cyB3aGVuIHRoZSBrZXJuZWwgaXMgZXhwb3NlZCB0byBpbmNvbnNpc3RlbnQgb24tZGlzayBzdGF0
ZS4KCkkgdGhvdWdodCB0aGlzIG1pZ2h0IHN0aWxsIGJlIHJlbGV2YW50IGZyb20gdHdvIGFuZ2xl
czoKCjEuIEFjY2lkZW50YWwgbWVkaWEgY29ycnVwdGlvbiBhdCBydW50aW1lCgpJbiBwcmFjdGlj
ZSwgc3RvcmFnZSBtYXkgcmV0dXJuIGluY29uc2lzdGVudCBtZXRhZGF0YSB3aGlsZSBtb3VudGVk
CmR1ZSB0byBiaXQgZmxpcHMsIGZhdWx0eSBmaXJtd2FyZSwgdHJhbnNpZW50IEkvTyBpc3N1ZXMs
IG9yIHBhcnRpYWwKd3JpdGVzLiBJbiB0aGF0IHNpdHVhdGlvbiwgZXZlbiBpZiB0aGUgZmlsZXN5
c3RlbSBtZXRhZGF0YSBpcyBubwpsb25nZXIgdHJ1c3R3b3J0aHksIGl0IHN0aWxsIHNlZW1zIGRl
c2lyYWJsZSB0aGF0IHRoZSBrZXJuZWwgcmVqZWN0CnRoZSBpbnZhbGlkIHN0YXRlIGNsZWFubHkg
cmF0aGVyIHRoYW4gaGl0IGEgTlVMTCBkZXJlZmVyZW5jZSBpbiBhCmRlZXBlciBwYXRoLgoKMi4g
UmVtb3RlIC8gZGlzdHJpYnV0ZWQgc3RvcmFnZSBzZXR1cHMKCkluIHNvbWUgY2xvdWQgb3IgZGlz
dHJpYnV0ZWQtc3RvcmFnZSBlbnZpcm9ubWVudHMsIHRoZSBtYWNoaW5lIHNlcnZpbmcKdGhlIGJh
Y2tpbmcgZGF0YSBtYXkgYmUgYnVnZ3kgb3IgY29tcHJvbWlzZWQsIG9yIHRoZSBkYXRhIG1heSBi
ZWNvbWUKY29ycnVwdGVkIGluIHRyYW5zaXQuIEZyb20gdGhlIGNsaWVudCBrZXJuZWzigJlzIHBl
cnNwZWN0aXZlLCB0aGlzIGlzCmFnYWluIHNpbWlsYXIgdG8gcmVjZWl2aW5nIG1hbGZvcm1lZCBt
ZXRhZGF0YSBmcm9tIHRoZSBzdG9yYWdlIGxheWVyLApzbyBJIHRob3VnaHQgaXQgbWlnaHQgYmUg
d29ydGggZW5zdXJpbmcgdGhhdCBzdWNoIGNhc2VzIGRvIG5vdCBhZmZlY3QKb3ZlcmFsbCBrZXJu
ZWwgc3RhYmlsaXR5LgoKSSBhbHNvIG5vdGljZWQgdGhhdCBmMmZzIGFscmVhZHkgc2VlbXMgdG8g
Y29udGFpbiBzb21lIGRlZmVuc2l2ZQpjaGVja3MgZm9yIHVuZXhwZWN0ZWQgcnVudGltZSBzdGF0
ZS4gRm9yIGV4YW1wbGUsIGluIGZzL2YyZnMvc2VnbWVudC5jCnRoZXJlIGlzIHRoZSBjb21tZW50
OgoKLyoKKiBJZiBjaGVja3BvaW50cyBhcmUgb2ZmLCB3ZSBtdXN0IG5vdCByZXVzZSBkYXRhIHRo
YXQKKiB3YXMgdXNlZCBpbiB0aGUgcHJldmlvdXMgY2hlY2twb2ludC4gSWYgaXQgd2FzIHVzZWQK
KiBiZWZvcmUsIHdlIG11c3QgdHJhY2sgdGhhdCB0byBrbm93IGhvdyBtdWNoIHNwYWNlIHdlCiog
cmVhbGx5IGhhdmUuCiovCgphbmQgdGhlcmUgaXMgYWxzbyB0aGUgZXh0cmEgX19jaGVja19zaXRf
Yml0bWFwKCkgdmVyaWZpY2F0aW9uIGJlZm9yZQpzdWJtaXNzaW9uLiBUaGF0IG1hZGUgbWUgdGhp
bmsgZjJmcyBkb2VzIGFscmVhZHkgdHJ5IHRvIGd1YXJkIGFnYWluc3QKY2VydGFpbiBmb3JtcyBv
ZiBydW50aW1lIGluY29uc2lzdGVuY3kgb3IgY29ycnVwdGlvbi4KClNvIG15IHRob3VnaHQgaGVy
ZSB3YXMgb25seSB0aGF0IGYyZnNfZ2V0X3BhcmVudCgpIG1pZ2h0IHdhbnQgdG8KZW5mb3JjZSBp
dHMgZXhwZWN0ZWQgaW52YXJpYW50IGEgYml0IGVhcmxpZXIsIHNpbmNlCmV4cG9ydF9vcGVyYXRp
b25zOjpnZXRfcGFyZW50IHNob3VsZCBvbmx5IG9wZXJhdGUgb24gZGlyZWN0b3J5CmRlbnRyaWVz
LiBUaGUgU19JU0RJUigpIGNoZWNrIHNlZW1lZCBsaWtlIGEgc21hbGwgZGVmZW5zaXZlIHZhbGlk
YXRpb24KdGhhdCBwcmV2ZW50cyB0aGUgbGF0ZXIgTlVMTCBkZXJlZmVyZW5jZS4KCkkgYW0gc3Rp
bGwgbGVhcm5pbmcgZmlsZXN5c3RlbSBkZXNpZ24gYW5kIGltcGxlbWVudGF0aW9uLCBzbyBpZiBt
eQp1bmRlcnN0YW5kaW5nIGFib3ZlIGlzIGluY29ycmVjdCwgSSB3b3VsZCByZWFsbHkgYXBwcmVj
aWF0ZSBhbnkKY29ycmVjdGlvbi4KClRoYW5rcyBhZ2FpbiBmb3IgeW91ciB0aW1lLgoKQmVzdCBy
ZWdhcmRzLApaaGVuZ1l1YW4gSHVhbmcKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZz
LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5l
dC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
