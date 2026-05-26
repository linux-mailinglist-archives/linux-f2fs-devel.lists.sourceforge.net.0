Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAraFUAWFmq7hQcAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 May 2026 23:53:04 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CE85DCEDC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 May 2026 23:53:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kWu1skAAutrhrBSpoqH7VnItV5Gd42tdPEG8CSY5Bjg=; b=EgQRqGLfhWl/cNI9oe7eXQnoGz
	930dJc5CMvCs3b9rysBuXvSBA99TAp/tTKIX0KudLwlHzyGGBzuTvrwKDu6bdnZ++oktT+cW+5CmZ
	IWBOQcY+UX6kMcmFavA4i4ISeq3dUSQ9n1YK84cykPur7OC6qhTP1VaZjRDcV0c1+8TY=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wRzhi-0005aI-Aq;
	Tue, 26 May 2026 21:52:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1wRzhg-0005a2-Li
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 May 2026 21:52:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YI4DLcvbXipAMyS1cQ/oZ3L9E0DlHKPUuIOEJebdbEE=; b=TkwUAKug5gov8JvshIlWWYNNzc
 SL6jsKtnZui1nK30U9rpNMWeypAbshLUwPXrvq2A5LTLEQof0TALUhel7N5pjxIcAJuTm6J/6OEjG
 3S8WjzxvJ33Nb6QPzFd+Tf0iYOXRmgDjY96edptjltLCHpA393H4DvnsZxIbtDY9NlcM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YI4DLcvbXipAMyS1cQ/oZ3L9E0DlHKPUuIOEJebdbEE=; b=UsKHAutTKEsfPTWgXLCIaIfBZi
 ITBXi0VAMdKMeC7S2OwBTN+Ch04Yh68vHmdavQ2iAbRp5RsVyo+S+GpnaDIK/1WxsPL4BdoLIlTaw
 Bu34ZnGX3yrRuShSwZQwy1cDuPUmfRslKZIE86y4x7AS5JEFwL7TRXznelBhVNl3cEuQ=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wRzhf-0008G9-AU for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 May 2026 21:52:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 6F73F408F6;
 Tue, 26 May 2026 21:52:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAAA91F000E9;
 Tue, 26 May 2026 21:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1779832362;
 bh=YI4DLcvbXipAMyS1cQ/oZ3L9E0DlHKPUuIOEJebdbEE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=jRKFuqdwRftvpOm9p7jpjT92MLNyesJVNfVyNIM6a8b28h8abHP+de6smVeNxUS9s
 AD0l4dGEhJdqCPFSNruEo3kcQA6qGgOohdfyV2+C9smodAtEedm7lj/yYzvCbZkX/N
 AhBesMpOvOXzZkccXIcGMs8/wpQZew5M3lYM1ffGf2mrdBelcDDj4zS/ARObMxNm3G
 36RGlLV6aHNIhk8jBnOLufsXmVucf93UgdJIqW71/oUxCpXCxMEbwYXjJTliOyrkre
 mwMAeN4DB/kKvUYAZAA90cKWwvgyv5XIZYsJd+ohbd9J2C3CKprqObflqhP8pgdeX3
 4QkN0Jb1ArP3g==
Date: Tue, 26 May 2026 21:52:40 +0000
To: Theodore Tso <tytso@mit.edu>
Message-ID: <ahYWKH9-ybDlZuJd@google.com>
References: <ad_AVHe7RMnGrGTb@google.com>
 <ad_HwhzlNPUEKQi6@casper.infradead.org>
 <ag7HfNryTmQ-bVIS@infradead.org>
 <20260521155748.GA79343@macsyma-wired.lan>
 <ag_OVwPF49LSZ7rz@google.com>
 <20260522141115.GA8258@macsyma-wired.lan>
 <ahCNmWbcd_2lAJyk@google.com>
 <20260522224108.GA18663@macsyma-wired.lan>
 <ahTzHyHBL8t0iNBR@google.com>
 <ybmbjekuvzmaw4hmlxd7nxs546dqtwmxqxwyali74d6m3u7tat@b4q3japqnhrl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ybmbjekuvzmaw4hmlxd7nxs546dqtwmxqxwyali74d6m3u7tat@b4q3japqnhrl>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 05/26, Theodore Tso wrote: > On Tue, May 26,
 2026 at 01:10:55AM
 +0000, Jaegeuk Kim wrote: > > Background > > > > The primary use case is
 accelerating AI model loading, which demands > > [...] 
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
X-Headers-End: 1wRzhf-0008G9-AU
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
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
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORGED_RECIPIENTS(0.00)[m:tytso@mit.edu,m:linux-api@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:hch@infradead.org,m:linux-mm@kvack.org,m:linux-fsdevel@vger.kernel.org,m:akailash@google.com,m:christian@brauner.io,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.994];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[jaegeuk@kernel.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Queue-Id: 85CE85DCEDC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gMDUvMjYsIFRoZW9kb3JlIFRzbyB3cm90ZToKPiBPbiBUdWUsIE1heSAyNiwgMjAyNiBhdCAw
MToxMDo1NUFNICswMDAwLCBKYWVnZXVrIEtpbSB3cm90ZToKPiA+IEJhY2tncm91bmQKPiA+IC0t
LS0tLS0tLS0KPiA+IFRoZSBwcmltYXJ5IHVzZSBjYXNlIGlzIGFjY2VsZXJhdGluZyBBSSBtb2Rl
bCBsb2FkaW5nLCB3aGljaCBkZW1hbmRzCj4gPiBleGNlcHRpb25hbGx5IGhpZ2ggc2VxdWVudGlh
bCByZWFkIHNwZWVkcy4gSW4gb3VyIGJlbmNobWFya3Mgb24gZW1iZWRkZWQKPiA+IHN5c3RlbXM6
Cj4gPiAgLSBVc2luZyBoaWdoLW9yZGVyIHBhZ2UgYWxsb2NhdGlvbnMgYWxsb3dzIHRoZSBzeXN0
ZW0gdG8gc2F0dXJhdGUgdGhlCj4gPiAgICBVbml2ZXJzYWwgRmxhc2ggU3RvcmFnZSAoVUZTKSBi
YW5kd2lkdGgsIHJlYWNoaW5nIDQgR0IvcyBldmVuIGF0Cj4gPiAgICBtZWRpdW0tdG8tbG93IENQ
VSBmcmVxdWVuY2llcy4KPiA+ICAtIEluIGNvbnRyYXN0LCBzdGFuZGFyZCBzbWFsbCBmb2xpb3Mg
Y2FwIHBlcmZvcm1hbmNlIGF0IDIgR0Ivcy4KPiAKPiBTbyB5b3UncmUgaW50ZXJlc3RlZCBpbiBv
cHRpbWl6aW5nIHRoZSBJL08gc3BlZWRzLiAgQW5kIGFwcGFyZW50eSwgb24KPiB5b3VyIGhhcmR3
YXJlLCB0aGUgVUZTIGNvbnRyb2xsZXIgaGFzIGxpbWl0cyBvbiBzY2F0dGVyLWdhdGhlciBlbnRy
aWVzCj4gLS0tIFVGUyBzZWVtcyB0byBjYWxsIHRoaXMgUGh5c2ljYWwgUmVnaW9uIERlc2NyaXB0
aW9uIChQUkQpIHRhYmxlCj4gZW50cmllcy4gIFBlciBHZW1pbmk6Cj4gCj4gICAgIDEuIFBSRCBT
ZWdtZW50ICYgTGVuZ3RoIExpbWl0cwo+IAkKPiAJTWF4aW11bSBQUkQgRW50cmllczogSGFyZHdh
cmUgbGltaXRzIHR5cGljYWxseSBjYXAgdGhlIG51bWJlcgo+IAkgICAgb2YgUFJEIGVudHJpZXMg
KG9yIHNlZ21lbnRzKSB0byAyNTUgb3IgMjU2IHBlciB0cmFuc2Zlcgo+IAkgICAgcmVxdWVzdC4K
PiAJCj4gCU1heGltdW0gVHJhbnNmZXIgTGVuZ3RoOiBFYWNoIGluZGl2aWR1YWwgUFJEIGVudHJ5
IHR5cGljYWxseQo+IAkgICAgYWxsb3dzIGEgbWF4aW11bSB0cmFuc2ZlciBzaXplIG9mICg2NSw1
MzUgYnl0ZXMpIHBlciBzZWdtZW50Lgo+IAo+ICAgICAyLiBIb3N0IENvbnRyb2xsZXIgSGFyZHdh
cmUgTGltaXRzIChVRlNIQ0kpCj4gICAgIAo+IAlUcmFuc2ZlciBRdWV1ZSBEZXB0aDogQSBVRlMg
Y29udHJvbGxlciBzdXBwb3J0cyBhIHByZWRlZmluZWQKPiAJICAgIG51bWJlciBvZiBvdXRzdGFu
ZGluZyB0YXNrIHJlcXVlc3QgZW50cmllcy4gVGhpcyBpcyBvZnRlbgo+IAkgICAgaGFyZC1jYXBw
ZWQgYXQgMzIgY29uY3VycmVudCB0cmFuc2ZlciByZXF1ZXN0cyAoc2xvdHMpIGJ5IHRoZQo+IAkg
ICAgZG9vcmJlbGwgcmVnaXN0ZXIgYXJyYXkuCj4gCQo+IAlEZXNjcmlwdG9yIFByZS1mZXRjaDog
U29tZSBVRlMgaG9zdCBjb250cm9sbGVycyBhcmUKPiAJICAgcHJlLWNvbmZpZ3VyZWQgdG8gcHJl
LWZldGNoIG11bHRpcGxlIFBSRCBlbnRyaWVzIHNlcXVlbnRpYWxseQo+IAkgICBiZWZvcmUgcmVx
dWlyaW5nIG1haW4gbWVtb3J5IHJlYWRzLgo+IAo+IElzIHRoaXMgYW4gYWNjdXJhdGUgZGVzY3Jp
cHRpb24gb2YgdGhlIGxpbWl0cyB0aGF0IHlvdSBhcmUgdHJ5aW5nIHRvCj4gd29yayB3aXRoPyAg
SG93IG11Y2ggZGF0YSBhcmUgeW91IHRyeWluZyB0byByZWFkPyAgTG9va2luZyBhdCBHZW1tYSA0
Cj4gbW9kZWxzLCBFMkIgaXMgYWJvdXQgMTBHQiBvciAzR0IgZm9yIHRoZSA0LWJpdCBxdWFudGl6
ZWQgdmVyc2lvbi4gIEU0Qgo+IGlzIDE1R0IsIG9yIDVHQiBmb3IgdGhlIDQtYml0IHF1YW50aXpl
ZCB2ZXJzaW9uLiAgSXMgdGhhdCBhYm91dCByaWdodD8KPiAKPiBJdCBzZWVtcy4uLiBzdXJwcmlz
aW5nIHRoYXQgdGhlIGFkZGl0aW9uYWwgSS9PIG9wZXJhdGlvbnMgYXJlIGFjdHVhbGx5Cj4gdGhy
b3R0bG9pbmcgVUZTIGRldmljZSBiYW5kd2lkdGggYnkgMnggKDRHQi9zIHZzIDJHQi9zKS4gIEhh
dmUgeW91IGR1Zwo+IGludG8gd2h5IHRoaXMgaXMgaGFwcGVuaW5nLCBhbmQgd2hldGhlciB0aGVy
ZSBpcyBhbnl0aGluZyB0aGF0IGNhbiBiZQo+IG9wdGltaXplZCBiZWxvdyB0aGUgZmlsZSBzeXN0
ZW0/CgpJIGNhbid0IHRlbGwgdGhlIGV4YWN0IHNpemUgdGhvLCByb3VnaGx5IGl0J3MgYmV0d2Vl
biAxR0IgYW5kIDRHQi4gQW5kLApwZXIgbG90cyBvZiB0ZXN0IHJlc3VsdHMgd2l0aCB2YXJpb3Vz
IHR1bmluZ3MsIGl0IHR1cm5lZCBvdXQgbWVtb3J5CmFsbG9jYXRpb24gc3BlZWQgd2FzIHRoZSBj
dWxwcml0LiBJZiB3ZSB1c2UgNEtCIHBhZ2UsIHdlIGNvdWxkbid0IGdldAp0aGUgZnVsbCBiYW5k
d2lkdGggdW5sZXNzIHdlIHNldCB0aGUgYmlnZ2VzdCBjb3JlIHJ1bm5pbmcgdGhlIGhpZ2hlc3Qg
ZnJlcXVlbmN5LgpVbmZvcnR1bmF0ZWx5LCBob3dldmVyLCB3ZSBjYW4ndCB1c2UgdGhlIGNvcmUg
bGlrZSB0aGF0IGR1ZSB0byBwZXJmb3JtYW5jZQpkcm9wIG9mIG90aGVyIHN5c3RlbSBzZXJ2aWNl
IGFuZCBwb3dlciBkcmFpbi4KCj4gCj4gPiBQcm9ibGVtIFN0YXRlbWVudAo+ID4gLS0tLS0tLS0t
LS0tLS0tLS0KPiA+IEhpZ2gtb3JkZXIgcGFnZXMgYmVjb21lIGhlYXZpbHkgZnJhZ21lbnRlZCBh
bmQgc2NhcmNlIHNob3J0bHkgYWZ0ZXIKPiA+IGRldmljZSBib290LiAgV2UgY2Fubm90IGFmZm9y
ZCB0byBkZXBsZXRlIHRoZXNlIGxpbWl0ZWQgcmVzb3VyY2VzIG9uCj4gPiBkZWZhdWx0IGZpbGVz
eXN0ZW0gb3BlcmF0aW9ucyB1c2luZyBsYXJnZSBmb2xpb3MuIEluc3RlYWQsIHdlIG5lZWQgYQo+
ID4gbWVjaGFuaXNtIHRvIHN0cmljdGx5IHByaW9yaXRpemUgYW5kIHJlc2VydmUgaGlnaC1vcmRl
ciBhbGxvY2F0aW9ucwo+ID4gZm9yIHNwZWNpZmljLCBjcml0aWNhbCBwYXlsb2Fkc+KAlHNwZWNp
ZmljYWxseSwgbGFyZ2UgQUkgbW9kZWwgZmlsZXMuCj4gCj4gVGhlcmUncyBhIGZ1bmRhbWVudGFs
IGFzc3VtcHRpb24gaGVyZSwgd2hpY2ggaXMgdGhhdCB0aGUgb25seSB1c2Ugb2YKPiBoaWdoIG9y
ZGVyIHBhZ2VzIGlzIHRoZSBwYWdlIGNhY2hlLiAgVGhpcyBkb2Vzbid0IHRha2UgaW50byBhY2Nv
dW50Cj4gYW5vbnltb3VzIHBhZ2VzIHVzZWQgYnkgcHJvZ3JhbXMgdGhhdCBpc24ndCBiYWNrZWQg
YnkgZmlsZXMuICBOb3IgZG9lcwo+IGl0IHRha2UgaW50byBhY2NvdW50IGtlcm5lbCBtZW1vcnkg
YWxsb2NhdGlvbnMuCj4gCj4gQnV0IHRoYXQgYmVpbmcgc2FpZCwgeW91IHNlZW0gdG8gYmUgYXNz
dW1pbmcgdGhhdCB5b3UgY2FuIHJlZHVjZSB0aGUKPiBwcmVzc3VyZSBvbiBoaWdoIG9yZGVyIHBh
Z2VzIGJ5IG9ubHkgdXNpbmcgbGFyZ2UgZm9saW9zIGZvciB0aGVzZSBBSQo+IG1vZGVsIGZpbGVz
Lgo+IAo+IEJ1dCB0aGUgcHJvYmxlbSB3aXRoIHVzaW5nIHNtYWxsIGZvbGlvcyBpcyB0aGF0IGlm
IHlvdSB3YW50IHRvCj4gYWN0dWFsbHkgKnVzZSogdGhlIG1lbW9yeSwgdW5sZXNzIHlvdSB3YW50
IHRvIHNlZ21lbnQgb3V0IHRoZSBtZW1vcnkKPiBzbyBpdCBjYW4ndCBiZSB1c2VkIGZvciBhbnl0
aGluZyBvdGhlciB0aGFuIHRoZSBBSSBtb2RlbHMgKGUuZy4sIGJ5Cj4gdXNpbmcgc29tdGhpbmcg
bGlrZSBodWdldGxiZnMpIGl0J3MganVzdCBnb2luZyB0byBicmVhayB1cCB0aGUgbWVtb3J5Cj4g
aW50byBzbWFsbGVyIGZvbGlvcy4gIFNvIHRoYXQncyBub3QgYWN0dWFsbHkgZ29pbmcgdG8gKmhl
bHAqIGluIGFjdHVhbAo+IHJlYWwgbGlmZSB1c2UgY2FzZXMuICBJdCBtaWdodCBoZWxwIGZvciB5
b3VyIGFydGlmaWNpYWwgYmVuY2htYXJrcyAvCj4gZXhwZXJpbWVudHMsIGJ1dCBpbiB0aGUgcmVh
bCBsaWZlIGNhc2Ugd2hlcmUgQW5kcm9pZCBhcHBsaWNhdGlvbnMgYXJlCj4gcnVubmluZyBhbmQg
ZnJhZ21lbnRpbmcgYWxsIG9mIHRoZSBkZXZpY2UgbWVtb3J5LCB0aGUgbGFyZ2UgZm9saW9zCj4g
d29uJ3QgYmUgYXZhaWxhYmxlICphbnl3YXkqLgoKQWdyZWVkIGl0J3MgaGFyZCB0byBnZXQgdGhp
cyBkb25lIHBlcmZlY3RseSB0aG8sIGFzIHRoZSBiZXN0IGVmZm9ydCBvbiB0aGlzCnBhcnRpY3Vs
YXIgQUkgbW9kZWwgY2FzZSwgSSBmb2N1c2VkIG9uIHR3byB0aW1pbmdzIHdoZW4gbG9hZGluZyB0
aGUgbW9kZWxzOgoxKSByaWdodCBhZnRlciBkZXZpY2UgYm9vdCwgMikgZHluYW1pYyBsb2FkaW5n
IHdoZW4gcmVxdWlyZWQuIFRvIHNlY3VyZSBoaWdoCm9yZGVyIHBhZ2VzLCBmb3IgMSksIEkgZGlz
YWJsZWQgdGhlIGxhcmdlIGZvbGlvIGNvbnN1bWVkIGJ5IEVST0ZTLCB3aGlsZSBmb3IKMiksIEkg
dHJpZWQgdG8gY2FsbCBjb21wYWN0X21lbW9yeSBiZWZvcmUgbG9hZGluZyB0aGUgbW9kZWwuIEJv
dGggb2YgY2FzZXMsCkkgY291bGQgb2JzZXJ2ZSB3ZSBjb3VsZCBnZXQgZmFpciBhbW91bnQgb2Yg
bGFyZ2UgZm9saW9zLiBZZXMsIG5vdCAxMDAlIHRoby4KCj4gCj4gPiAKPiA+IFE6IFdoeSBpcyBk
ZXJlZ2lzdGVyaW5nIHRoZSBpbm9kZSBudW1iZXIgbGlua2VkIHRvIGlub2RlIGRlbGV0aW9uPwo+
ID4gQTogV2UgbmVlZCB0aGUgaGlnaC1vcmRlciBhbGxvY2F0aW9uIGhpbnQgdG8gcGVyc2lzdCBl
dmVuIGlmIHRoZSBpbm9kZSBpcwo+ID4gIHRlbXBvcmFyaWx5IGV2aWN0ZWQgZnJvbSB0aGUgVkZT
IGNhY2hlLiBUbyBhY2hpZXZlIHRoaXMsIHdlIG1haW50YWluIGEgdHJhY2tpbmcKPiA+ICBsaXN0
IG9mIGhpbnRlZCBpbm9kZSBudW1iZXJzLiBXaGVuIGEgZmlsZSBpcyBwZXJtYW5lbnRseSBkZWxl
dGVkLCBpdHMgaGludAo+ID4gIGJlY29tZXMgb2Jzb2xldGUsIHJlcXVpcmluZyB1cyB0byBkZXJl
Z2lzdGVyIGl0IGZyb20gdGhlIGxpc3QgdG8gcHJldmVudCBtZW1vcnkKPiA+ICBsZWFrcyBvciBp
ZGVudGlmaWVyIHJldXNlIGNvbmZsaWN0cy4KPiAKPiBBc3N1bWluZyB0aGF0IHRoZSBoaWdoLW9y
ZGVyIGFsbG9jYXRpb24gaGludCBpcyBhIGdvb2QgdGhpbmcsIHdoeSBub3QKPiBqdXN0IG1ha2Ug
aXQgcGVyc2lzdGVudD8gIGUuZy4sIGp1c3QgYSAqcmVhbCogZXh0ZW5kZWQgYXR0cmlidXRlCj4g
KHdoaWNoIGlzIG1vcmUgd2F0ZWZ1bCBvZiBzcGFjZSksIG9yIGdyYWIgYSBmbGFnIGluIHRoZSBv
bi1kaXNrIGYyZnMKPiBpbm9kZT8gIFRoZW4geW91IGRvbid0IG5lZWQgdG8gaGF2ZSBhbiBpbi1t
ZW1vcnkgbGlzdCBvZiBoaW50ZWQKPiBpbm9kZXM7IGluc3RlYWQsIHlvdSBjYW4ganVzdCBoYXZl
IHRoZSBBbmRyb2lkIHBhY2thZ2UgbWFuYWdlciBzZXQKPiB0aGF0IGZsYWcgaW5kaWNhdGluZyB0
aGF0IHlvdSB3YW50IHRoYXQgc3BlY2lhbCB0cmVhdG1lbnQuICBUaGlzIGlzCj4gYWxsIGFzc3Vt
aW5nIHRoYXQgd2UgbmVlZCBhbiBleHBsaWNpdCBoaW50LCB0aG91Z2guLi4uCgpJIHRoaW5rIHRo
YXQncyBkb2FibGUsIHllcywgaWYgdGhlIGV4cGxpY3QgaGludCBpcyBhY2NlcHRhYmxlLgoKPiAK
PiA+IE1hc3NpdmUgQUkgbW9kZWwgbG9hZGluZyBpcyBhIGxvbmctdGVybSBhcmNoaXRlY3R1cmFs
Cj4gPiBwYXJhZGlnbS4gUHJvdmlkaW5nIGEgdGFyZ2V0ZWQgVkZTL2ZpbGVzeXN0ZW0gaGludCB0
byBvcHRpbWl6ZSByZWFkCj4gPiBiYW5kd2lkdGggZm9yIHNwZWNpZmljIGxhcmdlIGRhdGFzZXRz
IGlzIGEgaGlnaGx5IHByYWN0aWNhbCwKPiA+IHJlcGVhdGFibGUgcGF0dGVybiB0aGF0IGFkZHJl
c3NlcyBhIHN5c3RlbWljIGJvdHRsZW5lY2sgaW4gZW1iZWRkZWQKPiA+IEFJIGRlcGxveW1lbnRz
Lgo+IAo+IEl0J3MgcmVhbGx5IHRvbyBiYWQgeW91IGRpZG4ndCBwcm9wb3NlIHRoaXMgYXMgYSBM
U0YvTU0gdG9waWMsIGFuZAo+IHByZXNlbnRlZCB0aGlzIGF0IGEgc2Vzc2lvbiBhdCBaYWdyZWIg
dHdvIHdlZWtzIGFnby4gIFRoYXQgd291bGQgaGF2ZQo+IGJlZW4gYSBtdWNoIG1vcmUgdXBzdHJl
YW0tZnJpZW5kbHkgd2F5IG9mIGNvbGxhYm9yYXRpbmcsIGFuZCBpdCBtaWdodAo+IGhhdmUgYWxs
b3dlZCB0aGUgbW0gZXhwZXJ0cyB0byBnaXZlIHlvdSBzb21lIG1vcmUgZHluYW1pYywgcmVhbC10
aW1lCj4gZmVlZGJhY2suCgpJbmRlZWQsIEkgd2FzIG9mZiBmcm9tIExTRi9NTSBmb3IgeWVhcnMg
ZHVlIHRvIHZhcmlvdXMgcHJvZHVjdCBpc3N1ZXMsIG5vdApyZWxhdGVkIEYyRlMgdGhvLiBMZXQg
bWUgbWFrZSBzb21lIGVmZm9ydCB0byBhdHRlbmQgdXBjb21pbmcgb25lcyBsaWtlIExQQywKaWYg
SSBjYW4gZ2V0IHRoZSBidWRnZXQgZnJvbSBjb21wYW55LgoKPiAKPiBDaGVlcnMsCj4gCj4gCQkJ
CQktIFRlZAo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51eC1mMmZzLWRldmVs
QGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xp
c3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51
eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZv
cmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
