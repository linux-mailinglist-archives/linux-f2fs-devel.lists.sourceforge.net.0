Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B78299D4E2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Oct 2024 18:42:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t0O9G-0006Iq-0O;
	Mon, 14 Oct 2024 16:42:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1t0O9E-0006Ih-Mn
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Oct 2024 16:42:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Hr0xD8M4MRg2PjbuhqOqvMjpJjIiuNPacT2+YwxSEVg=; b=gMf3VUVjRVkcs0bkr5TpLJGk+1
 djCPwnD6esCc1gtThj3WVuk3j5iDsSK36ptGLbBYR92b6oomcpjLMikGm5B9I3wgIUeaOixVITLCg
 BWcAfkviiX8WdMszPBIGbRLNyLFwhRxZ0WcE8SW2/NUff1pk/y6z/jieY6dBxQTJeFBA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Hr0xD8M4MRg2PjbuhqOqvMjpJjIiuNPacT2+YwxSEVg=; b=k5UKPaUI2ow/6A5g7poCvQ/y3B
 8lBnbfw4lkAnY2DiMVL/bgfpqaT+leykPq6++ESA5fBK0NthI+928OTN8UavQDyTqrYhF9SrnfXhH
 X38VkZ1FeOVbdo/CQOz2X/4bNZHwZyHN5lI4grfJqn3JkL2wyRAC9v1na6tIB2fnyLIc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t0O9E-0000wE-0y for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Oct 2024 16:42:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 39BD25C5B25;
 Mon, 14 Oct 2024 16:42:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED04FC4CEC3;
 Mon, 14 Oct 2024 16:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728924129;
 bh=1KbERnWutO72Tt0MSOPZCf25uus9t8+fv0RSQ+GO6GA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PsPFcVogPtt2s8+V7P6WzIDByjS9gnrdoD82tXuUE9h2gN0em614jhK6hF7VvwnnM
 CVo8uUImd81DekA2oFBjGTvJcFIPgtHSOAlNUM3XuYPF4dFMK+lRXdbB9Ld+4yL02Z
 Acx74AzIiHCHDKHCrRJ8pvUEqNhK4m6y+vLhwipqJK1ayVowRAfMq4Nj21O97TlMgu
 lKLkaUgC7jJm1UKBpE04v++zqdJ+9W8FG7Y0/Y71Re9WkUYMuomEDDQ8QmN0IBP/BQ
 FwKZYO4VsUG+78EHBhVHdQ9gouGPEZdN3LFf7yD9YdUhLfXa6pZCKu0lLW84azazrL
 otQ8bsyR9TOoA==
Date: Mon, 14 Oct 2024 16:42:07 +0000
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <Zw1J30Fn48uYCwK7@google.com>
References: <20241010192626.1597226-1-daeho43@gmail.com>
 <ZwyyiG0pqXoBFIW5@infradead.org>
 <CACOAw_yvb=jacbXVr76bSbCEcud=D1vw5rJVDO+TjZbMLYzdZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACOAw_yvb=jacbXVr76bSbCEcud=D1vw5rJVDO+TjZbMLYzdZQ@mail.gmail.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 10/14, Daeho Jeong wrote: > On Sun, Oct 13, 2024 at 10:56 PM
    Christoph Hellwig <hch@infradead.org> wrote: > > > > On Thu, Oct 10, 2024
    at 12:26:26PM -0700, Daeho Jeong wrote: > > > From: Daeho Je [...] 
 
 Content analysis details:   (-5.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t0O9E-0000wE-0y
Subject: Re: [f2fs-dev] [PATCH v5] f2fs: introduce device aliasing file
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
Cc: Christoph Hellwig <hch@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com,
 Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMTAvMTQsIERhZWhvIEplb25nIHdyb3RlOgo+IE9uIFN1biwgT2N0IDEzLCAyMDI0IGF0IDEw
OjU24oCvUE0gQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBpbmZyYWRlYWQub3JnPiB3cm90ZToKPiA+
Cj4gPiBPbiBUaHUsIE9jdCAxMCwgMjAyNCBhdCAxMjoyNjoyNlBNIC0wNzAwLCBEYWVobyBKZW9u
ZyB3cm90ZToKPiA+ID4gRnJvbTogRGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4K
PiA+ID4KPiA+ID4gRjJGUyBzaG91bGQgdW5kZXJzdGFuZCBob3cgdGhlIGRldmljZSBhbGlhc2lu
ZyBmaWxlIHdvcmtzIGFuZCBzdXBwb3J0Cj4gPiA+IGRlbGV0aW5nIHRoZSBmaWxlIGFmdGVyIHVz
ZS4gQSBkZXZpY2UgYWxpYXNpbmcgZmlsZSBjYW4gYmUgY3JlYXRlZCBieQo+ID4gPiBta2ZzLmYy
ZnMgdG9vbCBhbmQgaXQgY2FuIG1hcCB0aGUgd2hvbGUgZGV2aWNlIHdpdGggYW4gZXh0cmVudCwg
bm90Cj4gPgo+ID4gcy9leHRyZW50L2V4dGVudC9nCgpBcHBsaWVkIHdpdGggdGhlIGZpeC4KCj4g
Pgo+ID4gPiB1c2luZyBub2RlIGJsb2Nrcy4gVGhlIGZpbGUgc3BhY2Ugc2hvdWxkIGJlIHBpbm5l
ZCBhbmQgbm9ybWFsbHkgdXNlZCBmb3IKPiA+ID4gcmVhZC1vbmx5IHVzYWdlcy4KPiA+Cj4gPiBJ
cyB0aGVyZSBhbiBleHBsYW5hdGlvbiBzb21ld2hlcmUgd2hhdCBhICdkZXZpY2UgYWxpYXNpbmcg
ZmlsZScgaXM/Cj4gCj4gUGx6LCByZWZlciB0byB0aGlzIHBhdGNoIGFuZCB0aGUgZGVzY3JpcHRp
b24gdGhlcmUuCj4gCj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvamFlZ2V1ay9mMmZzLXRvb2xzLmdpdC9jb21taXQvP2g9ZGV2LXRlc3QmaWQ9OGNjNGUy
NTdlYzIwYmVlMjA3YmIwMzRkNWFjNDA2ZTFhYjMxZWFlYQoKQWxzbywgSSBhZGRlZCB0aGlzIGlu
IHRoZSBkZXNjcmlwdGlvbi4KCi0tLQogICAgRm9yIGV4YW1wbGUsCiAgICAibWtmcy5mMmZzIC1j
IC9kZXYvYmxvY2svdGVzdEB0ZXN0X2FsaWFzIC9kZXYvYmxvY2svbWFpbiIgZ2l2ZXMKICAgIGEg
ZmlsZSAkcm9vdC90ZXN0X2FsaWFzIHdoaWNoIGNhcnZlcyBvdXQgL2Rldi9ibG9jay90ZXN0IHBh
cnRpdGlvbi4KLS0tCgoKPiAKPiBUaGFuayB5b3UsCj4gCj4gCj4gPgo+IAo+IAo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgtZjJmcy1kZXZl
bCBtYWlsaW5nIGxpc3QKPiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+
IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMt
ZGV2ZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJj
ZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9s
aW51eC1mMmZzLWRldmVsCg==
