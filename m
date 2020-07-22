Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D040C229E74
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Jul 2020 19:24:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jyIU1-0006Tc-0r; Wed, 22 Jul 2020 17:24:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jyIU0-0006TR-4B
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Jul 2020 17:24:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/HHpGzrJoy14hqExaKjrZEGbrJSC7QQx9G2vTQlfxnM=; b=Z0gaCVKTZs9SfNGC/NxmcnJJmY
 d+tXABkWzch6w1uJFDmI7CKcXGH/IXOudD9g/IDy+qObpYuKJdrhWae2S9b8UxMHTJNBOpYg6Mfkw
 dejLogddvC44QNlGNxU82npE8TwdvGv+Y/6pJK7iLo1rlt7HaZJdD2SatKe1ayjUh53M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/HHpGzrJoy14hqExaKjrZEGbrJSC7QQx9G2vTQlfxnM=; b=IVQqPI+fHifQ5uE/QElXjyMhPM
 sXVHvPbqhuHdURRQTUU4P0w73Ad3xrRdN8RGHBXP6ZoyyLGunGq+IdFlj205Jxcny60QU62Arj+C0
 bVjahsZsnbEQZQrjiuQQKeA31DbhDGv9ASA4oTRbGA35szR98FgNINVj2ESk4qPDi3/E=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jyITy-00Dohr-VT
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Jul 2020 17:24:44 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 80ABB20781;
 Wed, 22 Jul 2020 17:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595438677;
 bh=tq+JUZsj5AqgXnL2XBkXkqSDwpXEWCNQo14xO0Bbgj4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S5ChkHzt67oS2+SLJyglBpw/aN+89aBu7menAe4zmmAVi7hKqKWd6Q6BpqDcuecrA
 xAkc3/rd7plKxLa20B65NfjxuDhMhu3/K/8iRv9sTNGtiYtaIP7s3ikBc7maCZb6Vo
 zgZE6HPk6INDytsvNyyIcPTU8PiNHsHgW8nVjgM4=
Date: Wed, 22 Jul 2020 10:24:37 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <20200722172437.GH3912099@google.com>
References: <20200719054409.3050516-1-daeho43@gmail.com>
 <20200719151640.GA301791@kroah.com>
 <20200722164356.GA3912099@google.com>
 <20200722170602.GA440171@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200722170602.GA440171@kroah.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jyITy-00Dohr-VT
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: add sysfs symbolic link to kobject
 with volume name
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMDcvMjIsIEdyZWcgS0ggd3JvdGU6Cj4gT24gV2VkLCBKdWwgMjIsIDIwMjAgYXQgMDk6NDM6
NTZBTSAtMDcwMCwgSmFlZ2V1ayBLaW0gd3JvdGU6Cj4gPiBPbiAwNy8xOSwgR3JlZyBLSCB3cm90
ZToKPiA+ID4gT24gU3VuLCBKdWwgMTksIDIwMjAgYXQgMDI6NDQ6MDhQTSArMDkwMCwgRGFlaG8g
SmVvbmcgd3JvdGU6Cj4gPiA+ID4gRnJvbTogRGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xl
LmNvbT4KPiA+ID4gPiAKPiA+ID4gPiBBZGRlZCBhIHN5bWJvbGljIGxpbmsgZGlyZWN0b3J5IHBv
aW50aW5nIHRvIGl0cyBkZXZpY2UgbmFtZQo+ID4gPiA+IGRpcmVjdG9yeSB1c2luZyB0aGUgdm9s
dW1lIG5hbWUgb2YgdGhlIHBhcnRpdGlvbiBpbiBzeXNmcy4KPiA+ID4gPiAoaS5lLiwgL3N5cy9m
cy9mMmZzL3ZvbF8jeCAtPiAvc3lzL2ZzL2YyZnMvc2RhMSkKPiA+ID4gCj4gPiA+IE5vLCBwbGVh
c2Ugbm8uCj4gPiA+IAo+ID4gPiBUaGF0IGlzIGFscmVhZHkgY3JlYXRlZCB0b2RheSBmb3IgeW91
IGluIC9kZXYvZGlzay8gIFRoZSBrZXJuZWwgZG9lcyBub3QKPiA+ID4gbmVlZCB0byBkbyB0aGlz
IGFnYWluLgo+ID4gPiAKPiA+ID4gSWYgeW91ciBkaXN0cm8vc3lzdGVtL3doYXRldmVyIGRvZXMg
bm90IHByb3ZpZGUgeW91IHdpdGggL2Rldi9kaXNrLyBhbmQKPiA+ID4gYWxsIG9mIHRoZSBzeW1s
aW5rcyBpbiB0aGVyZSwgdGhlbiB3b3JrIHdpdGggeW91ciBkaXN0cm8vc3lzdGVtL3doYXRldmVy
Cj4gPiA+IHRvIGRvIHNvLgo+ID4gCj4gPiBJIGRvbid0IGdldCB0aGUgcG9pbnQsIHNpbmNlIC9k
ZXYvZGlzayBwb2ludHMgZGV2aWNlIG5vZGUsIG5vdCBhbnkgc3lzZnMgZW50cnkuCj4gPiBEbyB5
b3UgbWVhbiB3ZSBuZWVkIHRvIGNyZWF0ZSBzeW1saW5rIHRvIC9zeXMvZnMvZjJmcy9kbS1YIGlu
IC9kZXYvZGlzaz8KPiAKPiBIdWgsIG5vISAgSXQncyBhbGwgZG9uZSBmb3IgeW91IHRvZGF5IGF1
dG9tYWdpY2FsbHkgYnkgdXNlcnNwYWNlOgo+IAo+ICQgdHJlZSAvZGV2L2Rpc2svYnktbGFiZWwv
Cj4gL2Rldi9kaXNrL2J5LWxhYmVsLwo+IOKUnOKUgOKUgCBib290IC0+IC4uLy4uL3NkYTEKPiDi
lJzilIDilIAgZmFzdF9kaXNrIC0+IC4uLy4uL21kMAo+IOKUnOKUgOKUgCByb290IC0+IC4uLy4u
L3NkYTIKPiDilJTilIDilIAgc3R1ZmYgLT4gLi4vLi4vZG0tMAo+IAo+IExvb2sgb24geW91ciBs
YXB0b3AvZGVza3RvcC9zZXJ2ZXIgdG9kYXkgZm9yIHRob3NlLCB0aGVyZSdzIGxvdHMgb2YKPiBz
eW1saW5rcyBpbiAvZGV2L2Rpc2svCgpXaGF0IEkgbWVhbiBpcyAiY3JlYXRpbmcgc3ltbGluayBm
cm9tICp1c2Vyc3BhY2UqIiwgYnV0IHRoZSBjb25jZXJuIGlzCiIvZGV2LyIgbG9va3MgbGlrZSBi
ZWluZyB1c2VkIGZvciBkZXZpY2Ugbm9kZXMgb25seSwgbm90IHN5c2ZzLgoKPiAKPiA+ID4gQWdh
aW4sIG5vIG5lZWQgdG8gZG8gdGhpcyBvbiBhIHBlci1maWxlc3lzdGVtLWJhc2lzIHdoZW4gd2Ug
YWxyZWFkeSBoYXZlCj4gPiA+IHRoaXMgYXJvdW5kIGZvciBhbGwgZmlsZXN5c3RlbXMsIGFuZCBo
YXZlIGhhZCBpdCBmb3IgMTUrIHllYXJzIG5vdy4KPiA+IAo+ID4gQ291bGQgeW91IHBvaW50IG91
dCB3aGVyZSB3ZSBjYW4gZ2V0IHRoaXM/IEFuZCwgdGhlIGxhYmVsIHN1cHBvcnQgZGVwZW5kcwo+
ID4gb24gcGVyLWZpbGVzeXN0ZW0gZGVzaWduLiBJJ20gbm90IHN1cmUgaG93IHRoaXMgY2FuIGJl
IGdlbmVyaWMgZW5vdWdoLgo+IAo+IFVzZXJzcGFjZSBrbm93cyBob3cgdG8gcmVhZCBsYWJlbHMg
b24gYSBwZXItZmlsZXN5c3RlbS1iYXNpcyBhbmQgZG9lcyBzbwo+IGp1c3QgZmluZS4gIFRoYXQn
cyBob3cgaXQgY3JlYXRlcyB0aG9zZSBzeW1saW5rcywgbm8ga2VybmVsIHN1cHBvcnQgaXMKPiBu
ZWVkZWQuCj4gCj4gVGhpcyBoYXMgYmVlbiBpbXBsZW1lbnRlZCBmb3IgMTUrIHllYXJzIG5vdywg
aXQncyBub3QgYSBuZXcgdGhpbmcuLi4KPiAKPiBOb3cgaWYgeW91ciBlbWJlZGRlZCBzeXN0ZW0g
ZG9lc24ndCBzdXBwb3J0IGl0LCB0aGF0J3MgdGhlIHVzZXJzcGFjZSBvZgo+IHRoYXQgc3lzdGVt
J3MgZmF1bHQsIGl0J3Mgbm90IHRoZSBrZXJuZWwncyBmYXVsdCBhdCBhbGwuICBHbyBmaXggeW91
cgo+IHVzZXJzcGFjZSBpZiB5b3Ugd2FudCB0aG9zZSB0aGluZ3MuCgpJJ20gbm90IHRhbGtpbmcg
YWJvdXQgd2hvc2UgZmF1bHQgdGhvLiA6KSBCeSBhbnkgY2hhbmNlLCBjb3VsZCB5b3UgcGxlYXNl
CnN1Z2dlc3QgYSBnb29kIGxvY2F0aW9uIHRvIGNyZWF0ZSBhIHN5bWxpbmsgZm9yIHRoaXMgc3lz
ZnMgZW50cnk/Cgo+IAo+IHRoYW5rcywKPiAKPiBncmVnIGstaAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBs
aXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMu
c291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
