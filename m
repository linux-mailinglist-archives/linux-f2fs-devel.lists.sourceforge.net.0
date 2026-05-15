Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKXuM+CbB2oD+wIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 16 May 2026 00:19:12 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C5D558BA7
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 16 May 2026 00:19:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m1rC0E6M1vlLB/FEPo9wLlZeH19flzi/ixCJNF1DTjI=; b=IYpjGC039ZhLpZiV7uwgnwyUdd
	cuVJ1LOPLtTjsECLEl9vN8abMK5grYDYSAPI1e+h3WPR3DBICGiCEI5IMHToZSjscGg94++REP+J3
	Iob+T2WINNs93TPUdCb1wBGyaEf6CL5NsWFKzII5H0VhCi6PKgeFS8n+2hfl6wUsQgns=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wO0s6-0005F4-51;
	Fri, 15 May 2026 22:19:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chrisl@kernel.org>) id 1wO0s4-0005Ep-G5
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 May 2026 22:19:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nLOP4eZBjEsFOJKb2AlLdYmcbjxfM6qIcB/R7/H5A5s=; b=BwpNg+pred738FYB4gl596K2wb
 LlMNWQNqRkKG7vXXJaCKRVwbcW2/c2/+Ub/zKlZjDdzAJhpY72S6sTqaLN9AmMYjCBb5kttWt/CNE
 laOPvp1Av9B0qY6g2/ROJhtx6kwMSS7Rw1oI6zNzsls6LOKrMgxxrREmGRyAB1FFXOiM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nLOP4eZBjEsFOJKb2AlLdYmcbjxfM6qIcB/R7/H5A5s=; b=IAaLR8NaRvmQlm6VG43Rp3T3NH
 fw//BSgEhkHKNz0vtQNr3YYzv5Loq37bSdwkdWRZPj08VL0U/3RqwEsG64u3cRMRua2+4kpWVSZik
 wf4YIk2T0/qjOhdfUcAhvJyOYDR/dOmMyPA9fBotl4itJDBDopzl9mv/nLRqqwD6l+f4=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wO0s4-0003DW-CC for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 May 2026 22:19:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4212F445D9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 May 2026 22:18:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13BC7C4AF0F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 May 2026 22:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778883534;
 bh=1MhrEcqiffOJJ9gu4tKqW5/j2FFYBdwL8v/OjHOXbE8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GTicYoCI2yr2rAe/AMU6ocS3i7LeGzP+5ynLWd/haZ7OK8z5QsL08GhRu4vI6vNmU
 /3SJUN65uYsO6Z6W57GiFhyamzuFs+17wJ2EPj9kxjsYdcXZy+4OY7C4TydzVuwIdP
 cqcIdDzhU29K9Oe1AlyD+O5jJc4jbWA6EeBEkcwAcnD95DXjA85X87gsLYpVZ0Vl+v
 s9ouykehmJF23xqYyIAgLfZ+jgPUx5hix68bt162AGCCbP31GBjIV+8LsNDU1NS6dl
 g1UnI8kJdJjySSQvW8vM9rhm8ucv7sproY87J44pKcG2J+gIOgiTGJhOMkBLiDtpqr
 b/+lLlGeQOBKw==
Received: by mail-yx1-f46.google.com with SMTP id
 956f58d0204a3-651bc83e74aso693078d50.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 May 2026 15:18:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ+mHbZU37XqL2Y1YH1BTgFmXfB07H0eAdWHVfiqNpcFueEcpJ4GnVU6u0oO5YwlIhOVORZl2AxmKb7krLaRKYFK@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzN1a6voVUoYzDYNh0bTncL4ReZOBrpKKQRrQJ3/f+O1+9tQ6qy
 9Lc7RwS2TnTA50TZybcETB7ix5Wh9NZAh78j9ANDUia9lJ0mIzOLDRpX9+OlPzSDtBWH16kEGFl
 sP/My9lf0yXt7kr8lnWzaGFAGq7bDruayrqQsxlKdsg==
X-Received: by 2002:a05:690e:2513:20b0:651:cd15:8c67 with SMTP id
 956f58d0204a3-65e226e2fb9mr5283044d50.15.1778883533149; Fri, 15 May 2026
 15:18:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260512053625.2950900-1-hch@lst.de>
 <20260512053625.2950900-6-hch@lst.de>
In-Reply-To: <20260512053625.2950900-6-hch@lst.de>
Date: Fri, 15 May 2026 15:18:42 -0700
X-Gmail-Original-Message-ID: <CACePvbUpuNF9VsFUnmGpSwA9mHERG9fAxqezO=gdLzU99gpEdw@mail.gmail.com>
X-Gm-Features: AVHnY4IEAMD4CIhbQwbpq5_x4qZkKrPnDwnZZ2hkgP66BNy2UiBnbzLNgfCVsSA
Message-ID: <CACePvbUpuNF9VsFUnmGpSwA9mHERG9fAxqezO=gdLzU99gpEdw@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, May 11,
 2026 at 10:37 PM Christoph Hellwig <hch@lst.de>
 wrote: > > Reflow setup_swap_extents so that the flag checking is not
 conditional
 on > a swap_activate method. This is currently a no-op [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1wO0s4-0003DW-CC
Subject: Re: [f2fs-dev] [PATCH 05/12] swap: cleanup setup_swap_extents
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
From: Chris Li via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chris Li <chrisl@kernel.org>
Cc: Paulo Alcantara <pc@manguebit.org>, linux-doc@vger.kernel.org,
 "Darrick J . Wong" <djwong@kernel.org>, Carlos Maiolino <cem@kernel.org>,
 Hyunchul Lee <hyc.lee@gmail.com>, linux-mm@kvack.org,
 Naohiro Aota <naohiro.aota@wdc.com>, linux-xfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, Namjae Jeon <linkinjeon@kernel.org>,
 linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-block@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Kairui Song <kasong@tencent.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-f2fs-devel@lists.sourceforge.net, Steve French <sfrench@samba.org>,
 linux-btrfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Trond Myklebust <trondmy@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 06C5D558BA7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.01 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:pc@manguebit.org,m:linux-doc@vger.kernel.org,m:djwong@kernel.org,m:cem@kernel.org,m:hyc.lee@gmail.com,m:linux-mm@kvack.org,m:naohiro.aota@wdc.com,m:linux-xfs@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linkinjeon@kernel.org,m:linux-cifs@vger.kernel.org,m:linux-nfs@vger.kernel.org,m:linux-block@vger.kernel.org,m:dlemoal@kernel.org,m:dsterba@suse.com,m:jaegeuk@kernel.org,m:axboe@kernel.dk,m:brauner@kernel.org,m:kasong@tencent.com,m:tytso@mit.edu,m:linux-f2fs-devel@lists.sourceforge.net,m:sfrench@samba.org,m:linux-btrfs@vger.kernel.org,m:anna@kernel.org,m:linux-fsdevel@vger.kernel.org,m:akpm@linux-foundation.org,m:trondmy@kernel.org,m:hyclee@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	FREEMAIL_CC(0.00)[manguebit.org,vger.kernel.org,kernel.org,gmail.com,kvack.org,wdc.com,suse.com,kernel.dk,tencent.com,mit.edu,lists.sourceforge.net,samba.org,linux-foundation.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[chrisl@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:email,mail.gmail.com:mid,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim]
X-Rspamd-Action: no action

T24gTW9uLCBNYXkgMTEsIDIwMjYgYXQgMTA6MzfigK9QTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNo
QGxzdC5kZT4gd3JvdGU6Cj4KPiBSZWZsb3cgc2V0dXBfc3dhcF9leHRlbnRzIHNvIHRoYXQgdGhl
IGZsYWcgY2hlY2tpbmcgaXMgbm90IGNvbmRpdGlvbmFsIG9uCj4gYSBzd2FwX2FjdGl2YXRlIG1l
dGhvZC4gIFRoaXMgaXMgY3VycmVudGx5IGEgbm8tb3AgYmVjYXVzZSB0aGUgc3dhcG9mZgo+IGNv
ZGUgc3RpbGwgY2hlY2tzIHRoZSBwcmVzZW5jZSBvZiBhIHN3YXBfZGVhY3RpdmF0ZSBtZXRob2Qs
IGJ1dCBpdAo+IHNpbXBsaWZpZXMgYWRkaW5nIGEgbmV3IGNoZWNrLCBhbmQgYWxzbyBtYWtlcyB0
aGUgU1dQX0FDVElWQVRFRCBmbGFnCj4gbW9yZSBjb25zaXN0ZW50Lgo+Cj4gU2lnbmVkLW9mZi1i
eTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+CgpBY2tlZC1ieTogQ2hyaXMgTGkgPGNo
cmlzbEBrZXJuZWwub3JnPgoKQ2hyaXMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZz
LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5l
dC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
