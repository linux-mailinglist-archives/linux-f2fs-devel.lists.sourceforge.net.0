Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGxTCAnHG2q4GAkAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 31 May 2026 07:28:41 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1B8614906
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 31 May 2026 07:28:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7SxKSYOGpjdch4Kk5rqxR29P4rVZkLJjumDLT0LzY1g=; b=L7GYyogvoEwbLuHy7yRfC8LsKV
	E40aqNH/0bZO92ryMJQckjOWvPB7jPRytdbEWqeXbGMOu3y3v1+s+idD5Nk9n9t1kUZshtmhI0Aqs
	FjDpt1qgRvU9V7Lzqrj+cciQKadugDev0FZMn3tpoLeNdWPgJsZ9KPon+xbPKG/K+IPg=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wTYis-0003QD-Ai;
	Sun, 31 May 2026 05:28:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <baohua@kernel.org>) id 1wTYiq-0003Q7-Ih
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 31 May 2026 05:28:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oJpSbrXN0X73x5V9/u/EQv8cWOQ13cY7JpP2vdc74R4=; b=nHoNCauVs7eYBkxOLxs3rdVCiQ
 1e5WBqnKSp4PuHBkWci5Kd8zz6JAG6f2LZHZZzci9MI7cmS9k9vBuFcnPQYD0WhHUzBj7mBruFVHS
 pbFcW63ESLwtbjg8dPCRgwbsImT2VpftNz3/Mjy4OVxK8RexQYNrd/lvoGk+EdJhVR8o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oJpSbrXN0X73x5V9/u/EQv8cWOQ13cY7JpP2vdc74R4=; b=YL2cJT1rhRHZlHkGC9lAI8v0yZ
 6cMDCk1Hh6IVnYyGD/z/DLKn8X0p5+vDzbAjPV7OFTxqUaNuv3FmiIw2gkWnOw02k8hCW02ALg7Ax
 2KwFqyaPhszpKK3bu/WURuDlI/sBgpChoQ7QWZIU4Ml1c+yX/df1a35mbWrtebjH1qzE=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wTYim-0005Mh-UD for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 31 May 2026 05:28:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id BA4E8601E2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 31 May 2026 05:28:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73EB01F00898
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 31 May 2026 05:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1780205294;
 bh=oJpSbrXN0X73x5V9/u/EQv8cWOQ13cY7JpP2vdc74R4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc;
 b=ht9a6pvBxNc+0tlAIDDDR0zj4rcTGB+EDbqNi92eTgV740lT1WSQzZlB7vynOLMJA
 AeUzHHhpvp8OD8VOanuLYl/0OdKkwbkUBqwMXAT5XObgLEVEddW5uiR+HUhZzrWtqw
 NCDSuZeA+oD/9Q7IAsg6B3z/ILYzZ5tXutsM1NWCbkMigYwlBIjvBbijA7K4VRximM
 tF3vv4S5aDKujJRaIXeOm8ndwcIjVz4lwRujQUJutXUQM10dWmXo8xJw9zIgZZ7Xq+
 sYfindI5nPK9Q9IcUbwO4gmMRhIfXWcwYST/z1VkMmk2UL9F0ILGrv7kRg15ZjsGz5
 s+boewmu2sbsA==
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-9155104b721so59728785a.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 30 May 2026 22:28:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ/QdO4BJFQNaShFkgMzWkOfzy2NbxvuKDvTlLFyyzxP18Ghdu8pvnxhxH61+fD1Md3VZyahWRv2mRVjM7SZTEXO@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwAuXFRL8Y4bG0t+fv0eEIweOwrTPNf367LEgy6ODyUd1rve+kh
 K5863Rj/hDQelltQfDg1Y+Ni1IPllRnB2PrR3REiWmjOBUgHhLwtlnc4ppY3TkV83z+r6exsy+E
 j2tNgMriRroVV4FD95+S2hZYJg6CsKsc=
X-Received: by 2002:a05:620a:a2d1:10b0:911:9a7a:8076 with SMTP id
 af79cd13be357-9153d96b5edmr605566585a.8.1780205293922; Sat, 30 May 2026
 22:28:13 -0700 (PDT)
MIME-Version: 1.0
References: <ag_OVwPF49LSZ7rz@google.com>
 <20260522141115.GA8258@macsyma-wired.lan>
 <ahCNmWbcd_2lAJyk@google.com> <20260522224108.GA18663@macsyma-wired.lan>
 <ahTzHyHBL8t0iNBR@google.com>
 <ybmbjekuvzmaw4hmlxd7nxs546dqtwmxqxwyali74d6m3u7tat@b4q3japqnhrl>
 <f4e521ac-2381-49ca-8dcc-3cb3cf3ffaea@acm.org>
 <ahaPDHiXcJoVShPv@infradead.org>
 <ahcU5xbVy7xjps02@google.com> <ahkl52N3RDcusCNd@infradead.org>
 <aht812OhSPFqIBPK@google.com>
In-Reply-To: <aht812OhSPFqIBPK@google.com>
Date: Sun, 31 May 2026 13:28:02 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4yJihngSY0GNcc+MwPHJjpF1qCnS8-UE1GwYoNDtEm9mQ@mail.gmail.com>
X-Gm-Features: AVHnY4K7tD5FaTjYu7fBuez0V9tZrcHA503rjhBejqB5_6W7Gc8g8vahJmbPfLY
Message-ID: <CAGsJ_4yJihngSY0GNcc+MwPHJjpF1qCnS8-UE1GwYoNDtEm9mQ@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, May 31,
 2026 at 8:12 AM Jaegeuk Kim <jaegeuk@kernel.org>
 wrote: > > On 05/28, Christoph Hellwig wrote: > > On Wed, May 27, 2026 at
 03:59:35PM +0000, Jaegeuk Kim wrote: > > > F2FS merges bios b [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wTYim-0005Mh-UD
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: another way to set large folio by
 remembering inode number
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
From: Barry Song via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Barry Song <baohua@kernel.org>
Cc: Theodore Tso <tytso@mit.edu>, Bart Van Assche <bvanassche@acm.org>,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, Akilesh Kailash <akailash@google.com>,
 Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.51 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:tytso@mit.edu,m:bvanassche@acm.org,m:linux-api@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:hch@infradead.org,m:linux-mm@kvack.org,m:linux-fsdevel@vger.kernel.org,m:akailash@google.com,m:christian@brauner.io,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-0.973];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[baohua@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Queue-Id: 4F1B8614906
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gU3VuLCBNYXkgMzEsIDIwMjYgYXQgODoxMuKAr0FNIEphZWdldWsgS2ltIDxqYWVnZXVrQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gMDUvMjgsIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+
ID4gT24gV2VkLCBNYXkgMjcsIDIwMjYgYXQgMDM6NTk6MzVQTSArMDAwMCwgSmFlZ2V1ayBLaW0g
d3JvdGU6Cj4gPiA+IEYyRlMgbWVyZ2VzIGJpb3MgYmVmb3JlIHN1Ym1pdF9iaW8sIHJlZ2FyZGxl
c3Mgb2Ygc21hbGwgb3IgbGFyZ2UgZm9saW9zLAo+ID4gPiBzaW5jZSB0aGUgYmxvY2sgYWRkcmVz
c2VzIGFyZSBjb25zZWN1dGl2ZS4gU28sIEkgdGhpbmsgSU8gc3Vic3lzdGVtIHdhcwo+ID4gPiB3
b3JraW5nIGluIGZ1bGwgc3BlZWQuCj4gPgo+ID4gQXMgZG9lcyBldmVyeSBvdGhlciByZW1vdGVs
eSBtb2Rlcm4gZmlsZSBzeXN0ZW0uICBCdXQgdGhhdCBtZXJnaW5nIGlzCj4gPiBzdXJwcmlzaW5n
bHkgZXhwZW5zaXZlLCB3aGljaCBpcyB3aHkgdXNpbmcgZm9saW9zIGdldHMgcmVhbGx5IG1ham9y
Cj4gPiBwZXJmb3JtYW5jZSBpbXByb3ZlbWVudHMuCj4gPgo+ID4gRm9yIG9uZSBkb2luZyB0aGVz
ZSBjaGVja3MgdG8gbWVyZ2UgdG91Y2ggcXVpdGUgYSBmZXcgY2FjaGUgbGluZXMuCj4gPiBTZWNv
bmQsIGRldmljZXMgYXJlIG9mdGVuIGEgbG90IG1vcmUgZWZmaWNpZW50IGlmIHRoZXkgc2VlIGZl
d2VyIFNHTAo+ID4gZW50cmllcy4gIEkuZS4gaGF2aW5nIGEgMU1CIGJpbyBhIHNpbmdsZSBTR0wg
dGVuZHMgdG8gd29yayBiZXR0ZXIgdGhhbgo+ID4gaGF2aW5nIDI1NiBvZiB0aGVtLgo+ID4gVGhl
IHNhbWUgaXMgdHJ1ZSBpbiB0aGUga2VybmVsIGNvZGUgaXRzZWxmLCBib3RoIGluIHRoZSBzdWJt
aXNzaW9uIHBhdGgKPiA+IChkbWEgbWFwcGluZyBhbmQgY28pLCBhbmQgZXZlbiBtb3JlIHNvIGlu
IHRoZSBwYWdlIGNhY2hlIGhhbmRsaW5nCj4gPiBib3RoIGJlZm9yZSBzdWJtaXR0aW5nIGFuZCBp
biB0aGUgY29tcGxldGlvbiBwYXRoLgo+ID4KPiA+IFNlZSBCYXJ0J3MgcGF0Y2ggYWJvdXQgaG93
IGxvbmcgdGhlIHdhbGsgb2YgdGhlIGJpb192ZWNzIGluIHRoZSBmMmZzCj4gPiBjb21wbGV0aW9u
IHBhdGggY2FuIHRha2UuICBXZSBoYWQgc2ltaWxhciBpc3N1ZXMgaW4gWEZTIGV2ZW4gaW4gdGhl
Cj4gPiB3b3JrcXVldWUgY29tcGxldGlvbiBwYXRoIGR1ZSB0byBsYWNrIG9mIHJlc2NoZWR1bGlu
ZywgYW5kIHRoZXNlIHNpbXBseQo+ID4gZ28gYXdheSB3aGVuIHlvdSBkbyB0aGUgZm9saW8gbWFu
aXB1bGF0aW9uIGluIGxhcmdlciBjaHVua3MgKExBWllfUFJFRU1QVAo+ID4gd291bGQgYXZvaWQg
dGhlIG5lZWQgdG8gZXhwbGljaXQgcmVzY2hlZHVsaW5nIHRoZXNlIGRheXMsIGJ1dCB0aGF0IGp1
c3QKPiA+IHBhcGVycyBvdmVyIHRoZSBzeW1wdG9tcyBpbiB0aGlzIGNhc2UpLgo+ID4KPgo+IEkg
c2VlLiBUaGF0J3MgYWxzbyBzdXBlciBoZWxwZnVsLiBMZXQgbWUga2ljayBvZmYgdGhlIGxhcmdl
IGZvbGlvIHN1cHBvcnQgYXNhcC4KPiBUaGFua3MuCgpIaSBKYWVnZXVrLAoKTmFuemhlIGhhcyBw
dXQgc2lnbmlmaWNhbnQgZWZmb3J0IGludG8gdGhpcyB3b3JrIGF0IFhpYW9taSBvdmVyCnRoZSBw
YXN0IHNldmVyYWwgbW9udGhzLiBMYXJnZSBmb2xpb3MgY2FuIG5vdyBiZSBzdXBwb3J0ZWQgb24K
bm9uLWltbXV0YWJsZSBmaWxlcy4KCkhlIGhhcyBjb25kdWN0ZWQgZXh0ZW5zaXZlIHRlc3Rpbmcg
b24gdGhlIFBpeGVsIDYgYW5kIGZpeGVkIGEKbnVtYmVyIG9mIGhhbmdzIGRpc2NvdmVyZWQgZHVy
aW5nIGRldmVsb3BtZW50LiBIZSBpcyBzdGlsbApiZW5jaG1hcmtpbmcgcGVyZm9ybWFuY2UsIGJ1
dCB0aGUgaW1wbGVtZW50YXRpb24gYXBwZWFycyB0byBiZQpyZWFzb25hYmx5IHN0YWJsZSBhdCB0
aGlzIHBvaW50LiBXZSBjYW4gcnVuIEFuZHJvaWQgTW9ua2V5IGZvcgptYW55IGhvdXJzIHdpdGhv
dXQgb2JzZXJ2aW5nIGFueSBoYW5ncy4KCklmIHlvdSB3b3VsZCBsaWtlIHRvIHNlZSBhbiBSRkMs
IEkgY2FuIGFzayBOYW56aGUgdG8gc2VuZCBvbmUKYXMgc29vbiBhcyBwb3NzaWJsZSBhZnRlciBz
b21lIGNsZWFudXAgYW5kIHBvbGlzaGluZy4KCkJlc3QgcmVnYXJkcywKQmFycnkKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVs
IG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRw
czovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVs
Cg==
