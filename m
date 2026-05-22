Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2G+tKFJkEGrvWwYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 May 2026 16:12:34 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5CD5B5EF9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 May 2026 16:12:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cozIoRbMHsx8lWzSZtzdm99c+luRBnwciVILzW2uJFo=; b=lFvlG+Zfs51ictHbSaP4hw1iWV
	bqi/362HrLKj0IKZwIR35hu1Y5ZJ0EVAEBnPi4VcYHCnKnXOdWr1PqHQmAw1C60WLkHwUhPHjGQbe
	AUfh2VqKXex46brqOGPWfUaV6ZgsF2j9ZUR2XkZ9WxY21jpp4lgJM5OQfZmP2vYRGo/A=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wQQbw-0007ZT-5c;
	Fri, 22 May 2026 14:12:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <tytso@mit.edu>) id 1wQQbI-0007Yd-8U
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 May 2026 14:11:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mHoK9Kgu4Ukogk/OuX5oJ2mC+IXl+XVKkhhR9Ymm7QI=; b=YE3dSvvqEURFeUbY6RYLkgOF+P
 oPVkMj8t23v1BxTD8N6rX35iMIf4N8Bk/50NuRwSWsnmHaLg0HPjAf58Pc1h5a5RtP+6ZVfMfDq7R
 m49guLRNhW7dIIl+mynw4Wutsjr7JSCq6HHU32B+rD/bAk3FGLd7+KCYCqMTrSGa9n3A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mHoK9Kgu4Ukogk/OuX5oJ2mC+IXl+XVKkhhR9Ymm7QI=; b=Bka/Gk340l04MRf4QJ2PAQbUTM
 zMPNY9wl6iMnvpaBol/AhX84e1QExxaSh0iBGg51G0DSKiEccj/PFIgcuKTZ06t1wmRY20NFK9oX/
 alasmMg1HJVh65eVjEtjGOpLU3JAnOiPHQEn9BppuFXHrbksy7+XLuvveMQHyO+sQsQs=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wQQbD-0002eL-E6 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 May 2026 14:11:41 +0000
Received: from macsyma.thunk.org (pool-173-48-115-85.bstnma.fios.verizon.net
 [173.48.115.85]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 64MEBFMM009434
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 May 2026 10:11:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1779459078; bh=mHoK9Kgu4Ukogk/OuX5oJ2mC+IXl+XVKkhhR9Ymm7QI=;
 h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
 b=lpmCqZgxMgz6LXGThL+FgpU/gHZm2q7cb9GG7Hmbw1HF0AaE+gTLZhx9dJOwJ0nAa
 2x/e4DVdk6Mue88+of/m4/ffVBkjFqZKlQf1pjyNfEHE3qjYAT5bb4AA+yS6hK29dF
 tpcNUTkTnuKZKnGb2yNXM1Xpq2G56JRBZFxvMjxungbdw4ZnXHfC9aHoYGP1zgzpe9
 rCykZkCrU7T2G0hk7TF/PTaBZd6uVu1liAacXiKKP6Mtbrh5RAchLbF0HPslHhm0PS
 hlvO2wQHeMa+U19lqVyv1mhCKetcXnea+xjcMVpqrI/U8nWD/W6aAO3aYuPE2RV/Mq
 Mp2pkRBJcpAFA==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
 id 38EDE69D5323; Fri, 22 May 2026 10:11:15 -0400 (EDT)
Date: Fri, 22 May 2026 10:11:15 -0400
From: "Theodore Tso" <tytso@mit.edu>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <20260522141115.GA8258@macsyma-wired.lan>
References: <20260409134538.3692605-1-jaegeuk@kernel.org>
 <adhPZxtbZxgU-37v@google.com> <ad30g9xMs9wNJhFb@infradead.org>
 <ad_AVHe7RMnGrGTb@google.com>
 <ad_HwhzlNPUEKQi6@casper.infradead.org>
 <ag7HfNryTmQ-bVIS@infradead.org>
 <20260521155748.GA79343@macsyma-wired.lan>
 <ag_OVwPF49LSZ7rz@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ag_OVwPF49LSZ7rz@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, May 22, 2026 at 03:32:39AM +0000, Jaegeuk Kim wrote:
 > I went this route because Android heavily restricts ioctl() permissions
 > and we needed broader access for this to work within the framew [...] 
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
X-Headers-End: 1wQQbD-0002eL-E6
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
Cc: linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, Akilesh Kailash <akailash@google.com>,
 Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-0.91 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[mit.edu : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:linux-api@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:hch@infradead.org,m:linux-mm@kvack.org,m:linux-fsdevel@vger.kernel.org,m:akailash@google.com,m:christian@brauner.io,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[tytso@mit.edu,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,mit.edu:s=outgoing];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tytso@mit.edu,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,mit.edu:-];
	NEURAL_HAM(-0.00)[-0.991];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Queue-Id: DE5CD5B5EF9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gRnJpLCBNYXkgMjIsIDIwMjYgYXQgMDM6MzI6MzlBTSArMDAwMCwgSmFlZ2V1ayBLaW0gd3Jv
dGU6Cj4gSSB3ZW50IHRoaXMgcm91dGUgYmVjYXVzZSBBbmRyb2lkIGhlYXZpbHkgcmVzdHJpY3Rz
IGlvY3RsKCkgcGVybWlzc2lvbnMKPiBhbmQgd2UgbmVlZGVkIGJyb2FkZXIgYWNjZXNzIGZvciB0
aGlzIHRvIHdvcmsgd2l0aGluIHRoZSBmcmFtZXdvcmsuIEl04oCZcwo+IGRlZmluaXRlbHkgYSBw
cmFnbWF0aWMgY2hvaWNlIGp1c3QgdG8gZ2V0IGl0IHJ1bm5pbmcgaW4gcHJvZHVjdGlvbi4KPiAK
PiBJZiBpb2N0bCgpIGlzIGEgcmlnaHQgd2F5IGZvciB1cHN0cmVhbSwgSSdtIGhhcHB5IHRvIGNo
YW5nZSB0aGlzIHBhdGNoLiBCeQo+IHRoZSB3YXksIEkgcmVhbGx5IGRvbid0IHVuZGVyc3RhbmQg
d2h5IGFsbCB0aGUgbWVzc2FnZXMgYXJlIHNvIG9mZmVuc2l2ZSwKPiBldmVuIHdpdGhvdXQgdHJ5
aW5nIHRvIHVuZGVyc3RhbmQgdGhlIHByb2JsZW0gb3IgZ3VpZGluZyByaWdodCBkaXJlY3Rpb25z
LgoKVGhlIHJlYXNvbiB3aHkgc29tZSBwZW9wbGUgd2VyZSBnZXR0aW5nIGFubm95ZWQgd2FzIGJl
Y2F1c2UgYXMgYSBMaW51eApmaWxlIHN5c3RlbSBtYWludGFpbmVyLCB0aGVyZSB3YXMgYW4gYXNz
dW1wdGlvbiB0aGF0IHlvdSB3b3VsZAp1bmRlcnN0YW5kIHRoYXQgZXh0ZW5kZWQgYXR0cmlidXRl
cyAtLS0gZXNwZWNpYWxseSBpbiB0aGUgdXNlci4qCm5hbWVzcGFjZSAtLS0gaGF2ZSBhbiBpbnRl
bmRlZCB1c2UgY2FzZSBvZiBzdG9yaW5nIGEgdXNlci1jaG9zZW4gc21hbGwKcGllY2Ugb2YgbWV0
YWRhdGEgdGhhdCB3b3VsZCBiZSBzdG9yZWQgaW4gdGhlIGZpbGUgc3lzdGVtLgoKSGlqYWNraW5n
IHVzZXIuZmFkdmlzZSBzdWNoIHRoYXQgaXQgbm8gbG9uZ2VyIHBlcnNpc3RlbnQgc3RvcmVzIGFu
CmV4dGVuZGVkIGF0dHJpYnV0ZSBmb3Igb25lIHNwZWNpZmljIGZpbGUgc3lzdGVtIC0tLSBzdWNo
IHRoYXQgaWYgYQpoeXBvdGhldGljYWwgdXNlciBhcHBsaWNhdGlvbiBtaWdodCBkZWNpZGUgdG8g
c3RvcmUgYSBwaWVjZSBvZgphcHBsaWNhdGlvbiBkYXRhIGluIHRoZSBleHRlbmRlZCBhdHRyaWJ1
dGUgbmFtZWQgImZhZHZpc2UiIHdvdWxkIGRvCnNvbWV0aGluZyBjb21wbGV0ZWx5IGRpZmZlcmVu
dCBvbiBhIHNpbmdsZSBtYWlubGluZSBmaWxlIHN5c3RlbSBpcyBpbgpzdWNoIHBvb3IgdGFzdGUg
dGhhdCBJIHdvdWxkIGhhdmUgKmhvcGVkKiB0aGF0IGFueSBMaW51eCBmaWxlIHN5c3RlbQptYWlu
dGFpbmVyIHdvdWxkIGtub3cgdGhhdCB0aGlzIGEgUmVhbGx5IEJhZCBUaGluZywgc3VjaCB0aGF0
IGlmCnNvbWVvbmUgaW4geW91ciBkZXZlbG9wbWVudCBjb21tdW5pdHkgc3VnZ2VzdGVkIHN1Y2gg
YW4gaWRlYSwgeW91CndvdWxkIHJlamVjdCBpdC4KCkFuZCB0aGVuLCB3aGVuIHBlb3BsZSBjb21w
bGFpbmVkIHRoYXQgaXQgd2FzIGEgYmFkIGlkZWEsIGFuZCB5b3UKZGVjaWRlZCB0byBwdXQgaW4g
dGhlIGYyZnMgYnJhbmNoLCBzdWNoIHRoYXQgaXQgd291bGQgc2hvdyB1cCBpbgpsaW51eC1uZXh0
LCBhbmQgdGhlcmUgd2FzIG5vIHdheSBmb3Igb3RoZXIgZmlsZSBzeXN0ZW0gZGV2ZWxvcGVycyB0
bwpvYmplY3QgKHNob3J0IG9mIGFwcGVhbGluZyB0byBMaW51cykgLS0tIHdlbGwsIHRoYXQncyBi
YXNpY2FsbHkgeW91CnRha2luZyBhZHZhbnRhZ2Ugb2YgeW91ciBmaWxlIHN5c3RlbSBtYWludGFp
bmVyIHByaXZpbGVnZXMuICBBbmQgdGhpcwppcyB3aHkgSSBzdGFydGVkIHByb3Bvc2luZyB3aGV0
aGVyIHdlIG5lZWRlZCB0byBhcHBlYWwgdGhpcyB0byBMaW51cwpzbyBoZSBjb3VsZCBtYWtlIHRo
ZSBjYWxsIHRvIHJlamVjdCBzb21ldGhpbmcgdGhhdCB0aGUgY29tbXVuaXR5IGhhZAphbHJlYWR5
IHRvbGQgeW91IHdhcyBpbiB0ZXJyaWJsZSwgdGVycmlibGUgdGFzdGUuCgpBcyBmYXIgYXMgdHJ5
aW5nIHRvIHVuZGVyc3RhbmQgd2h5IHlvdSB3ZXJlIGRvaW5nIHRoaXMgLS0tIEkgaGF2ZSB0bwp0
dXJuIHRoYXQgcXVlc3Rpb24gYXJvdW5kLiAgV2h5IGRpZG4ndCAqeW91KiBleHBsYWluIHdoeSB5
b3UgbmVlZGVkIHRvCmRvIHRoaXMgdGhpbmc/ICBJIHdlbnQgdGhyb3VnaCB0aGUgZS1tYWlsIGhp
c3RvcnksIGFuZCBJIGNvdWxkbid0IGZpbmQKYW4gZXhwbGFuYXRpb24gb2Ygd2h5IHlvdSBkZWNp
ZGVkIHRvIGRvIHRoaXMgdGhpbmcuICAKClBlcmhhcHMgd2UgbmVlZCB0byBhZGQgYW4gZXhwbGFu
YXRpb24gdGhlIERvY3VtZW50YXRpb24gZGlyZWN0b3J5CmV4cGxhaW5pbmcgd2hhdCB0aGUgaW50
ZW5kZWQgdXNlIG9mIHRoZSBleHRlbmRlZCBhdHRyaWJ1dGUgY2FzZSwgYW5kCnBlcmhhcHMgcmVm
ZXJlbmNpbmcgcGFzdCBjYXNlcyB3ZXJlIHBlb3BsZSB0cmllZCB0byB1c2UgdGhpcyB0byBieXBh
c3MKdGhlIGxpbnV4LWFwaSByZXZpZXcgcHJvY2VzcyAoZjJmcydzIHVzZXIuZmFkdmlzZSBpcyBu
b3QgdGhlIGZpcnN0CnRpbWUgc29tZW9uZSBoYXMgdHJpZWQgdG8gZG8gdGhpcykgdGhpbmcpLCBz
byB0aGF0IGF1dG9tYXRlZCByZXZpZXcKYm90cyBsaWtlIFNhc2hpa28gY2FuIGV4cGxhaW4gd2h5
IGl0J3MgaW4gc3VjaCB0ZXJyaWJsZSB0YXN0ZSB0byBwYXRjaAphdXRob3JzLCBwZXJoYXBzIHdl
IG5lZWQgdG8gZG8gdGhpcy4gIFVwIHVudGlsIG5vdywgSSB0aGluayB0aGUKYXNzdW1wdGlvbiBp
cyB0aGF0IGZpbGUgc3lzdGVtIG1haW50YWluZXJzIHdvdWxkIGtub3cgc29tZXRoaW5nIHRoaXMK
c2VsZi1ldmlkZW50LCBhbmQgaWYgbm90LCBpZiBpdCB3YXMgcG9pbnRlZCBvdXQsIHRoZXkgd291
bGRuJ3QgdHJ5IHRvCmZvcmNlIHN1Y2ggYW4gaWxsLWFkdmlzZWQgaW50ZXJmYWNlIHRvIExpbnVz
LgoKCQkJCQkJLSBUZWQKClAuUy4gIEFzIGFuIGV4bWFwbGUgb2YgaG93IEkgaGFubGRlZCBhIHNv
bWV3aGF0IHNpbWlsYXIgc2NlbmFyaW8gaW4KdGhlIHBhc3QsIG15IGVtcGxveWVyJ3MgY2x1c3Rl
ciBmaWxlIHN5c3RlbSBuZWVkZWQKRkFMTE9DX0ZMX05PX0hJREVfU1RBTEUgdG8gc2F2ZSAkJCQk
IGluIFRDTyBzdG9yYWdlIGNvc3RzLiAgQnV0IHRoZQpjb25jZXJuIHdhcyB0aGlzIHdvdWxkIGJl
IGFuIGF0dHJhY3RpdmUgbnVpc2FuY2UgZm9yIGVudGVycHJpc2UgZGlzdHJvCnVzZXJzLCB3aG8g
d291bGQgc2VlIHRoZSBtYXNzaXZlIHBlcmZvcm1hbmNlIGluY3JlYXNlLCBub3QgcmVhbGl6ZQp0
aGF0IHRoaXMgd291bGQgbGVhayBzdGFsZSBkYXRhLCB3aGljaCBjb3VsZCByZXN1bHQgaW4gdXNl
ciBQSUkgYmVpbmcKZXhwb3NlZCwgdGh1cyBtYWtpbmcgbGlmZSBoYXJkIGZvciBFbnRlcnByaXNl
IExpbnV4J3MgcmVwdXRhdGlvbi4KKFRoaXMgd2Fzbid0IGFuIGlzc3VlIGF0ICRXT1JLIGJlY2F1
c2Ugd2UgZW5yeXB0IGFsbCBkYXRhIGF0IHJlc3QsIGFuZAp0aGUgY2x1c3RlciBmaWxlIHN5c3Rl
bSBkYWVtb24gd2FzIGEgcHJpdmlsZWdlZCBzZXJ2ZXIgd2hvIChhKSBrbmV3CndoYXQgaXQgd2Fz
IGRvaW5nLCBhbmQgKGIpIG9ubHkgaXQgd291bGQgaGF2ZSBhY2Nlc3MgdG8gc2V0CkZBTExPQ19G
TF9OT19ISURFX1NUQUxFLikKCkkgZGlzY2xvc2VkICp3aHkqICRXT1JLIG5lZWRlZCBzdWNoIGEg
dGhpbmcgKGl0IG1hZGUgYSBodWdlIGRpZmZlcmVuY2UKdG8gc3RvcmFnZSBUQ08gY29zdHNzIGZv
ciBHb29nbGUncyBDbHVzdGVyIEZpbGVzeXN0ZW0pLCBhbmQgYWZ0ZXIKZGlzY3Vzc2lvbiBhbmQg
bmVnb3RpYXRpb24sIHdlIGNhbWUgdG8gYSBjb21wcm9taXNlIHdoaWNoIGludm9sdmVkIG15Cmtl
ZXBpbmcgdGhlICh2ZXJ5IHNtYWxsKSBwYXRjaCBvdXQgb2YgdHJlZSwgYnV0IHJlc2VydmluZyB0
aGUgY29kZQpwb2ludCB1cHN0cmVhbSB0byBhdm9pZCBmdXR1cmUgYml0ZmllbGQgY29sbGlzaW9u
cy4gIFRoZXkga2V5IGhlcmUgd2FzCnRoYXQgSSAqa25ldyogaXQgd2FzIGNvbnRyb3ZlcnNpYWws
IGFuZCBJIHVuZGVyc3Rvb2Qgd2hhdCBwcm9ibGVtcyBpdAptaWdodCBjYXVzZSBpbiB0aGUgcmVz
dCBvZiB0aGUgZWNvc3lzdGVtLiAgVGhhdCdzIHBhcnQgb2YgdGhlIGpvYiBvZiBhCm1haW50YWlu
ZXIsIGFuZCBpdCdzIGFsc28gd2h5IGEgY29tcGFueSBtaWdodCB3YW50IHRvIGhpcmUgYQptYWlu
dGFpbmVyLiAgVGhleSBjYW4gcmVwcmVzZW50IHRoZSBuZWVkcyBvZiBtdWx0aXBsZSBzdGFrZWhv
bGRlcnMgLS0tCnRoZSB1cHN0cmVhbSBjb21tdW5pdHksIHVwc3RyZWFtIHVzZXJzIGFuZCB0aGUg
Z3JlYXRlciBMaW51eAplY29zeXN0ZW0sIGFzIHdlbGwgYXMgdGhlaXIgZW1wbG95ZXIuCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1k
ZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQK
aHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1k
ZXZlbAo=
