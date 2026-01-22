Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABXZOWSucmmyogAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jan 2026 00:10:28 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2902B6E69A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jan 2026 00:10:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TjHr9Q8PttFRAHP4+SpBbk1Rm/CrnPj98A562yNyGpM=; b=YG+a6hCeMWHjLAHv9cWOOJmfzp
	pSxFFeEWw9H4DhRi1fcuvTNA6voSsMh8n3TcAN0krll7CVR2EgQdRclPn3VhEyKGRlcrz+rtk6/da
	RFrbU2PWNC1hhzEkcvRafTAQfCfrnIH76lWFSuJ99Wr30PkuRxXtttLC4xQbRSVNLEVE=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vj3oi-0006rO-8z;
	Thu, 22 Jan 2026 23:10:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vj3oh-0006rI-1o
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jan 2026 23:10:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QKGo7jMsN/U1vOBjuSV19b09BgAn3eYneG38zQknyWY=; b=jKMAp5r+Bcg1IF2LrFEEAlAViE
 JSntddAmDHuK1dP1cPqOKoT/UUWwZ4GuZoJC1urLBYjG6ldIwGl3yutlSpYFzZxVWjwp4DVHRD2mN
 5i7txXPsNz2m8f801Kz6X5GIagqQcoQ8noZLhHeSwGi/cgOsTdVj9QhzuTv+qXzjlyL8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QKGo7jMsN/U1vOBjuSV19b09BgAn3eYneG38zQknyWY=; b=QdYUp5Zu6ZOO3R6LnHrl/gdbhg
 K+Sg5ebxzYYhJhVT+awqmB/5Ly9OlmSCPrcgOs4tYd2w6Ou49D3wtknaExoH0gIj5iLkrjNHQXLCg
 Pseaxjs6yLSCLBqdrvOpnnoSmpG6N4sVWOcejdYrMrmTHZcBNY6Y3FKZa92j3pEleVSg=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vj3og-0000zN-KO for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jan 2026 23:10:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E073F601EA;
 Thu, 22 Jan 2026 23:10:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C8C5C116C6;
 Thu, 22 Jan 2026 23:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769123407;
 bh=MuVfXGFqvN4b9rtKnsw7f7k0jXBoLGLHcxbyWCpsDG0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N771VZ06ckyaVD5smskptolM6rLPMvk7CGaed3+ghoj6uMTd4oujKTL009NTnKB5/
 SSnKxkGYQFtSn5aglULD60jmYlaIzuXL9HfTGWNuaG6sThXQQjePJ7PnYw6ME/MwxZ
 7A1TYQ3WnLOOGadL5Mf8HaAVoqmQ3n+1VTCWmzkiid5q5akwsLFwgSvhzSUV/srRNj
 2f1A+TXLe2oBY4XjRAWuLvnJPkptaicpdN9OcSTMoEC30XVVb5uEfRWztdSKuMspD2
 ftnDPKJoI2fC+t+wNW09+oeO6/XFTkByBpooTQJBzhY+j7KBAnF/WS+eVChpUStiuX
 etmyhW8rKBD+A==
Date: Thu, 22 Jan 2026 23:10:05 +0000
To: Nanzhe Zhao <nzzhao@126.com>
Message-ID: <aXKuTRfZXE4z0j1_@google.com>
References: <20260109024716.12047-1-chao@kernel.org>
 <CAGsJ_4wjXMXk4YKsYebmtTa5dKVO21b91ieY=foYULWS+DyroQ@mail.gmail.com>
 <2cdd4281-7e37-4dd0-91b1-1ab16ef772aa@kernel.org>
 <CAGsJ_4weE5T1uBA1-JoJdbZY4E91eN_OL3hMdqixLcoKSrmuzw@mail.gmail.com>
 <8c13ca69-a08a-41c7-bbef-0a79a5f44f93@kernel.org>
 <83419982-77ba-4dac-880e-bf59669a006f@126.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <83419982-77ba-4dac-880e-bf59669a006f@126.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 01/22, Nanzhe Zhao wrote: > Hi all: > > 在 2026/1/9 16:44,
    Chao Yu via Linux-f2fs-devel 写道: > > > w/ above locks, it seems there
    is still a race condition as below: > > > > f2fs_fileattr_set r [...] 
 
 Content analysis details:   (-0.3 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vj3og-0000zN-KO
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to prevent clearing immutable for
 large folio supported inode
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Barry Song <21cnbao@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.51 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:nzzhao@126.com,m:21cnbao@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[126.com];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.967];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.sourceforge.net];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[jaegeuk@kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: 2902B6E69A
X-Rspamd-Action: no action

T24gMDEvMjIsIE5hbnpoZSBaaGFvIHdyb3RlOgo+IEhpIGFsbDoKPiAKPiDlnKggMjAyNi8xLzkg
MTY6NDQsIENoYW8gWXUgdmlhIExpbnV4LWYyZnMtZGV2ZWwg5YaZ6YGTOgo+IAo+ID4gdy8gYWJv
dmUgbG9ja3MsIGl0IHNlZW1zIHRoZXJlIGlzIHN0aWxsIGEgcmFjZSBjb25kaXRpb24gYXMgYmVs
b3c6Cj4gPiAKPiA+IGYyZnNfZmlsZWF0dHJfc2V0wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHJlYWQKPiA+ICDCoC0gZjJmc19zZXRmbGFnc19jb21tb24KPiA+ICDCoCAtIHRydW5jYXRl
X3BhZ2VjYWNoZQo+ID4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgLSBmMmZzX3JlYWRfZGF0YV9sYXJnZV9mb2xpbwo+ID4gIMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgOiByZWFkIGxhcmdlIGZvbGlvcwo+ID4gIMKg
IC0gbWFwcGluZ19zZXRfZm9saW9fb3JkZXJfcmFuZ2UKPiA+IAo+ID4gVGhhbmtzLAo+IAo+IEkg
bm90aWNlZCB0aGF0IHRoZSBjb21tZW50IGZvciBgbWFwcGluZ19zZXRfZm9saW9fb3JkZXJfcmFu
Z2UoKWAgc2F5czoKPiAKPiA+ICJDb250ZXh0OiBUaGlzIHNob3VsZCBub3QgYmUgY2FsbGVkIHdo
aWxlIHRoZSBpbm9kZSBpcyBhY3RpdmUgYXMgaXQgaXMgbm9uLWF0b21pYy4iCj4gCj4gSSdtIG5v
dCBzdXJlIHdoZXRoZXIgY2FzZXMgbGlrZSBmMmZzX2ZpbGVhdHRyX3NldCBmYWxscyBpbnRvIHRo
ZSBpbm9kZQo+IGFjdGl2ZSBjYXNlLgo+IAo+ID4gPiAKPiA+ID4gCj4gPiA+IElmIGNsZWFyaW5n
IGltbXV0YWJsZSBpcyBpbmRlZWQgcmFyZSwgd2UgbWF5IGxlYXZlIHRoaXMgYXMgaXMsIHNpbmNl
Cj4gPiA+IHdyaXRlcyBhcmUgbm90IHN1cHBvcnRlZCB1bnRpbCB0aGUgcGFnZSBjYWNoZSBpcyBm
dWxseSBkcm9wcGVkLgo+ID4gPiBFdmVudHVhbGx5LCB3ZSB3aWxsIHN1cHBvcnQgbGFyZ2UgZm9s
aW9zIG9uIG5vbi1pbW11dGFibGUgZmlsZXMuCj4gPiA+IAo+ID4gPiBUaGFua3MKPiA+ID4gQmFy
cnkKPiAKPiBBbHNvLCBJIGNvdWxkbuKAmXQgZmluZCBhbnkgQVBJIGluIGBpbmNsdWRlL2xpbnV4
L3BhZ2VtYXAuaGAgdGhhdCBjYW4KPiBhdG9taWNhbGx5IHNldCB0aGUKPiBmb2xpbyBvcmRlciBy
YW5nZS4gSG93ZXZlciwgSSB0aGluayBkeW5hbWljYWxseSBzZXR0aW5nIGxhcmdlIGZvbGlvIG9y
ZGVyCj4gd2hpbGUgYW4gaW5vZGUKPiBpcyBhY3RpdmUgaXMgYSByZWFzb25hYmxlIHJlcXVpcmVt
ZW50LiBJbiBteSBub24gaW1tdXRhYmxlIGZpbGUgbGFyZ2UgZm9saW8KPiB3cml0ZSB3b3JrLCBJ
IG5lZWQgdG8gZW5hYmxlIGxhcmdlIGZvbGlvIHN1cHBvcnQgZm9yIGEgZmlsZSB3aGVuIGl0IGlz
Cj4gY29udmVydGVkIGZyb20gYW4gaW5saW5lIGZpbGUgdG8gYSBub24taW5saW5lIGZpbGUuIFRo
ZSBsYWNrIG9mIGFuIGF0b21pYwo+IEFQSSBzZWVtcyB0byBiZSBhIGJsb2NrZXIgZm9yIG1vdmlu
ZyBsYXJnZSBmb2xpbyB3cml0ZSBmb3J3YXJkLgo+IEFueSBpZGVhIG9uIHRoYXQ/CgpZZXMsIEkg
d2FzIGhpdHRpbmcgc29tZSBpc3N1ZXMgd2hlbiBJIGNvbnZlcnQgdGhlIG1hcHBpbmcgd2hpbGUg
aW5vZGUgaXMgYWxpdmUuClNvLCBmb3Igbm93LCB3ZSBzaG91bGQgc2V0IGl0IGluIGYyZnNfaWdl
dCgpIG9ubHkuCgo+IAo+IFRoYW5rcywKPiBOYW56aGUgWmhhbwo+IAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGlu
ZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlz
dHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
