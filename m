Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 239D370BF44
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 May 2023 15:10:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q15J6-0007XQ-Ab;
	Mon, 22 May 2023 13:10:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1q15J1-0007XJ-3s
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 May 2023 13:10:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O05g9nSh0916COPsVh8UQ/8TeApFfjFm0pb6csgSQDs=; b=XywBPLojTjT6KV77+iyYs29dj9
 Q25DkaoGskXW93R6LHwtmp0XbMdw92Y68DWSUfC5KS5KkbeGfd98KWClvFytGg3/h5t9+bYLHWCkg
 AbUGzfxF7ECqb/34/Lrw33/TliLaxc+dmeFjGSojXp4obVzpBcrLHB5n/nynV2cqf3P8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=O05g9nSh0916COPsVh8UQ/8TeApFfjFm0pb6csgSQDs=; b=OBtd02AwZr2iIeeRJ2DmVnivxL
 I89HBKzu3Y96/tdH2HsUR8JuTcqDSVjfitcvrGnB9GZaEFHYzGYCVy77/j5knhNHs1pcoOuXEXjcR
 T/q1HdegV7bQPOj53axHJUUghDKc3RQEXohYdfRryPsu8mvcCvi7pC/xWbXXRDoEpyXs=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q15J0-00FnI0-KK for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 May 2023 13:10:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3DF126141D;
 Mon, 22 May 2023 13:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94D49C433D2;
 Mon, 22 May 2023 13:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684761024;
 bh=Z2/GVvSJC2G0Dwf+VtmLymanWbXvsmzV4PzURu78kG4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ehXWsE3LgzGrcI6X3XpFdeLUpot14B6BIwqaT5qKwUVtve6EDRqwY3N2yNcWNQ8+W
 nORfj1cJcaq9RpkXVfRdIhlXIj9XzW+guz8Qeud2l3wiGj3Ty3+Plue9QigrLMZQt9
 o0Gg+wybqRs5f2wwVKopX9dn+eSayBcLB3BMw91ixZc6MtYuQL3E44eYFNnWIqBsfK
 ciZiub685aaP1Qqm9AbSVPV4zZgfTxfqoir7qgP4KkWqjuLmBTZJmNPoY8hNIGTwsh
 4+WqWKrhBqfsiebIUaasWQEpCEvvoXQmSl58KxiBYPCd7TCONEeg4QGW/8LOcxjbtc
 ozqVe8DjwVjEQ==
Message-ID: <049ff411-175c-6874-7c84-74aa074e40e4@kernel.org>
Date: Mon, 22 May 2023 21:10:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Juhyung Park <qkrwngud825@gmail.com>
References: <CAD14+f3z=kS9E+NTKH7t1J2xL1PpLOVMNx=CabD_t2K6U=T9uQ@mail.gmail.com>
 <b03137d3-cf73-60f7-3c0c-33c9beb9b209@kernel.org>
 <CAD14+f0xZguG9NG5anRzabgKrhvMeWO+kKrzXnL1MuM2gZ_yxA@mail.gmail.com>
 <68037247-6206-4419-fd87-52ee26c6df80@kernel.org>
 <CAD14+f3J_ReeS4VvqBZnLs04i=iXN36MJRWc_Pa95tftnZrtRg@mail.gmail.com>
 <c7f5350c-c13f-5079-9b1d-cc04ef04e246@kernel.org>
 <CAD14+f0-+NF63rePDBeAx1yk6aB==nirjyZAfgurt5UbvVsY2Q@mail.gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CAD14+f0-+NF63rePDBeAx1yk6aB==nirjyZAfgurt5UbvVsY2Q@mail.gmail.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Juhyung, On 2023/5/19 2:12, Juhyung Park wrote: > Hi Chao,
 > > Thanks for the patch. I'll try it out on both my laptop and workstation
 soon. Thank you! Let me know if you have any concern or suggestion. :) 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q15J0-00FnI0-KK
Subject: Re: [f2fs-dev] [DISCUSSION] f2fs for desktop
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Alexander Koskovich <akoskovich@pm.me>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgSnVoeXVuZywKCk9uIDIwMjMvNS8xOSAyOjEyLCBKdWh5dW5nIFBhcmsgd3JvdGU6Cj4gSGkg
Q2hhbywKPiAKPiBUaGFua3MgZm9yIHRoZSBwYXRjaC4gSSdsbCB0cnkgaXQgb3V0IG9uIGJvdGgg
bXkgbGFwdG9wIGFuZCB3b3Jrc3RhdGlvbiBzb29uLgoKVGhhbmsgeW91ISBMZXQgbWUga25vdyBp
ZiB5b3UgaGF2ZSBhbnkgY29uY2VybiBvciBzdWdnZXN0aW9uLiA6KQoKPiAKPiBPbmUgcXVlc3Rp
b24gdGhvdWdoOiB3b3VsZCBpdCBtYWtlIHNlbnNlIHRvIHNlZSBpZiBpdCB3b3JrcyBmaW5lIG9u
Cj4gQW5kcm9pZCB0b28/IChXaXRoIHVzZXJzcGFjZSdzIGV4cGxpY2l0IEdDIHRyaWdnZXIgZGlz
YWJsZWQuKQoKSSBjYW4gc2VlIHRoYXQgaHVhd2VpL2hvbm9yIGFyZSBzdGlsbCB1c2luZyB0aGlz
IGZlYXR1cmUsIEkgcmVtZW1iZXIgdGhhdCBpZGxlCnVyZ2VudCBHQyBmZWF0dXJlIGlzIG5vdCBh
dmFpbGFibGUgYW5kIHdoZW4gdGhpcyBmZWF0dXJlIHNoaXBwZWQgaW4gcHJvZHVjdHMuCgpJIGd1
ZXNzIHNvLCBpdCdzIGZpbmUgdG8gdXNlIHRoaXMgZmVhdHVyZSBpbiBBbmRyb2lkIGlmIG1hbnVh
bCBHQyBmcm9tIHVzZXJzcGFjZQppcyBkaXNhYmxlZC4KClRoYW5rcywKCj4gTWF5YmUgaXQgY291
bGQgYmUgYW4gaW5kaWNhdGlvbiBvbiB3aGV0aGVyIGl0IHdvcmtzIHByb3Blcmx5IG9yIG5vdD8K
PiAKPiBUaGFua3MsCj4gCj4gT24gVGh1LCBNYXkgMTgsIDIwMjMgYXQgNDo1M+KAr1BNIENoYW8g
WXUgPGNoYW9Aa2VybmVsLm9yZz4gd3JvdGU6Cj4+Cj4+IE9uIDIwMjMvNC8yMSAxOjI2LCBKdWh5
dW5nIFBhcmsgd3JvdGU6Cj4+PiBIaSBDaGFvLAo+Pj4KPj4+IE9uIEZyaSwgQXByIDIxLCAyMDIz
IGF0IDE6MTnigK9BTSBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pj4+Cj4+Pj4g
SGkgSnVIeXVuZywKPj4+Pgo+Pj4+IFNvcnJ5IGZvciBkZWxheSByZXBseS4KPj4+Pgo+Pj4+IE9u
IDIwMjMvNC8xMSAxOjAzLCBKdWh5dW5nIFBhcmsgd3JvdGU6Cj4+Pj4+IEhpIENoYW8sCj4+Pj4+
Cj4+Pj4+IE9uIFR1ZSwgQXByIDExLCAyMDIzIGF0IDEyOjQ04oCvQU0gQ2hhbyBZdSA8Y2hhb0Br
ZXJuZWwub3JnPiB3cm90ZToKPj4+Pj4+Cj4+Pj4+PiBIaSBKdWh5dW5nLAo+Pj4+Pj4KPj4+Pj4+
IE9uIDIwMjMvNC80IDE1OjM2LCBKdWh5dW5nIFBhcmsgd3JvdGU6Cj4+Pj4+Pj4gSGkgZXZlcnlv
bmUsCj4+Pj4+Pj4KPj4+Pj4+PiBJIHdhbnQgdG8gc3RhcnQgYSBkaXNjdXNzaW9uIG9uIHVzaW5n
IGYyZnMgZm9yIHJlZ3VsYXIgZGVza3RvcHMvd29ya3N0YXRpb25zLgo+Pj4+Pj4+Cj4+Pj4+Pj4g
VGhlcmUgYXJlIGdyb3dpbmcgbnVtYmVyIG9mIGludGVyZXN0cyBpbiB1c2luZyBmMmZzIGFzIHRo
ZSBnZW5lcmFsCj4+Pj4+Pj4gcm9vdCBmaWxlLXN5c3RlbToKPj4+Pj4+PiAyMDE4OiBodHRwczov
L3d3dy5waG9yb25peC5jb20vbmV3cy9HUlVCLU5vdy1TdXBwb3J0cy1GMkZTCj4+Pj4+Pj4gMjAy
MDogaHR0cHM6Ly93d3cucGhvcm9uaXguY29tL25ld3MvQ2xlYXItTGludXgtRjJGUy1Sb290LU9w
dGlvbgo+Pj4+Pj4+IDIwMjM6IGh0dHBzOi8vY29kZS5sYXVuY2hwYWQubmV0L35uZXh1c3ByaXNt
L2N1cnRpbi8rZ2l0L2N1cnRpbi8rbWVyZ2UvNDM5ODgwCj4+Pj4+Pj4gMjAyMzogaHR0cHM6Ly9j
b2RlLmxhdW5jaHBhZC5uZXQvfm5leHVzcHJpc20vZ3J1Yi8rZ2l0L3VidW50dS8rbWVyZ2UvNDQw
MTkzCj4+Pj4+Pj4KPj4+Pj4+PiBJJ3ZlIGJlZW4gcGVyc29uYWxseSBydW5uaW5nIGYyZnMgb24g
YWxsIG9mIG15IHg4NiBMaW51eCBib3hlcyBzaW5jZQo+Pj4+Pj4+IDIwMTUsIGFuZCBJIGhhdmUg
c2V2ZXJhbCBjb25jZXJucyB0aGF0IEkgdGhpbmsgd2UgbmVlZCB0byBjb2xsZWN0aXZlbHkKPj4+
Pj4+PiBhZGRyZXNzIGZvciByZWd1bGFyIG5vbi1BbmRyb2lkIG5vcm1pZXMgdG8gdXNlIGYyZnM6
Cj4+Pj4+Pj4KPj4+Pj4+PiBBLiBCb290bG9hZGVyIGFuZCBpbnN0YWxsZXIgc3VwcG9ydAo+Pj4+
Pj4+IEIuIEhvc3Qtc2lkZSBHQwo+Pj4+Pj4+IEMuIEV4dGVuZGVkIG5vZGUgYml0bWFwCj4+Pj4+
Pj4KPj4+Pj4+PiBJJ2xsIGdvIHRocm91Z2ggZWFjaCBvbmUuCj4+Pj4+Pj4KPj4+Pj4+PiA9PT0g
QS4gQm9vdGxvYWRlciBhbmQgaW5zdGFsbGVyIHN1cHBvcnQgPT09Cj4+Pj4+Pj4KPj4+Pj4+PiBJ
dCBzZWVtcyB0aGF0IGJvdGggR1JVQiBhbmQgc3lzdGVtZC1ib290IHN1cHBvcnRzIGYyZnMgd2l0
aG91dCB0aGUKPj4+Pj4+PiBuZWVkIGZvciBhIHNlcGFyYXRlIGV4dDQtZm9ybWF0dGVkIC9ib290
IHBhcnRpdGlvbi4KPj4+Pj4+PiBTb21lIGRpc3Ryb3MgYXJlIHNlZW1pbmdseSBkaXNhYmxpbmcg
ZjJmcyBtb2R1bGUgZm9yIEdSVUIgdGhvdWdoIGZvcgo+Pj4+Pj4+IHNlY3VyaXR5IHJlYXNvbnM6
Cj4+Pj4+Pj4gaHR0cHM6Ly9idWdzLmxhdW5jaHBhZC5uZXQvdWJ1bnR1Lytzb3VyY2UvZ3J1YjIv
K2J1Zy8xODY4NjY0Cj4+Pj4+Pj4KPj4+Pj4+PiBJdCdzIHVsdGltYXRlbHkgdXAgdG8gdGhlIGRp
c3RybyBmb2xrcyB0byBlbmFibGUgdGhpcywgYW5kIHN0aWxsIGluCj4+Pj4+Pj4gdGhlIHdvcnN0
LWNhc2Ugc2NlbmFyaW8sIHRoZXkgY2FuIHNwZWNpZnkgYSBzZXBhcmF0ZSAvYm9vdCBwYXJ0aXRp
b24KPj4+Pj4+PiBhbmQgZm9ybWF0IGl0IHRvIGV4dDQgdXBvbiBpbnN0YWxsYXRpb24uCj4+Pj4+
Pj4KPj4+Pj4+PiBUaGUgaW5zdGFsbGVyIGl0c2VsZiB0byBzaG93IGYyZnMgYW5kIGNhbGwgbWtm
cy5mMmZzIGlzIGJlaW5nIHdvcmtlZAo+Pj4+Pj4+IG9uIGN1cnJlbnRseSBvbiBVYnVudHUuIFNl
ZSB0aGUgMjAyMyBsaW5rcyBhYm92ZS4KPj4+Pj4+Pgo+Pj4+Pj4+IE5vdGhpbmcgZjJmcyBtYWlu
bGluZSBkZXZlbG9wZXJzIHNob3VsZCBkbyBoZXJlLCBpbW8uCj4+Pj4+Pj4KPj4+Pj4+PiA9PT0g
Qi4gSG9zdC1zaWRlIEdDID09PQo+Pj4+Pj4+Cj4+Pj4+Pj4gZjJmcyByZWxpZXZlcyBtb3N0IG9m
IHRoZSBkZXZpY2Utc2lkZSBHQyBidXQgaW50cm9kdWNlcyBhIG5ldwo+Pj4+Pj4+IGhvc3Qtc2lk
ZSBHQy4gVGhpcyBpcyBleHRyZW1lbHkgY29uZnVzaW5nIGZvciBwZW9wbGUgd2hvIGhhdmUgbm8K
Pj4+Pj4+PiBiYWNrZ3JvdW5kIGluIFNTRHMgYW5kIGZsYXNoIHN0b3JhZ2UgdG8gdW5kZXJzdGFu
ZCwgbGV0IGFsb25lCj4+Pj4+Pj4gZGlzY2FyZC90cmltL2VyYXNlIGNvbXBsaWNhdGlvbnMuCj4+
Pj4+Pj4KPj4+Pj4+PiBJbiBtb3N0IGNvbnN1bWVyLWdyYWRlIGJsYWNrYm94IFNTRHMsIGRldmlj
ZS1zaWRlIEdDcyBhcmUgaGFuZGxlZAo+Pj4+Pj4+IGF1dG9tYXRpY2FsbHkgZm9yIHZhcmlvdXMg
d29ya2xvYWRzLiBmMmZzLCBob3dldmVyLCBsZWF2ZXMgdGhhdAo+Pj4+Pj4+IHJlc3BvbnNpYmls
aXR5IHRvIHRoZSB1c2Vyc3BhY2Ugd2l0aCBjb25zZXJ2YXRpdmUgdHVuaW5nIG9uIHRoZQo+Pj4+
Pj4KPj4+Pj4+IFdlJ3ZlIHByb3Bvc2VkIGEgZjJmcyBmZWF0dXJlIG5hbWVkICJzcGFjZSBhd2Fy
ZWQgZ2FyYmFnZSBjb2xsZWN0aW9uIgo+Pj4+Pj4gYW5kIHNoaXBwZWQgaXQgaW4gaHVhd2VpL2hv
bm9yJ3MgZGV2aWNlcywgYnV0IGZvcmdvdCB0byB0cnkgdXBzdHJlYW1pbmcKPj4+Pj4+IGl0LiA6
LVAKPj4+Pj4+Cj4+Pj4+PiBJbiB0aGlzIGZlYXR1cmUsIHdlIGludHJvZHVjZWQgdGhyZWUgbW9k
ZToKPj4+Pj4+IC0gcGVyZm9ybWFuY2UgbW9kZTogc29tZXRoaW5nIGxpa2Ugd3JpdGUtZ2MgaW4g
ZnRsLCBpdCBjYW4gdHJpZ2dlcgo+Pj4+Pj4gYmFja2dyb3VuZCBnYyBtb3JlIGZyZXF1ZW50bHkg
YW5kIHR1bmUgaXRzIHNwZWVkIGFjY29yZGluZyB0byBmcmVlCj4+Pj4+PiBzZWdzIGFuZCByZWNs
YWltYWJsZSBibGtzIHJhdGlvLgo+Pj4+Pj4gLSBsaWZldGltZSBtb2RlOiBzbG93IGRvd24gYmFj
a2dyb3VuZCBnYyB0byBhdm9pZCBoaWdoIHdhZiBpZiB0aGVyZQo+Pj4+Pj4gaXMgbGVzcyBmcmVl
IHNwYWNlLgo+Pj4+Pj4gLSBiYWxhbmNlIG1vZGU6IGJlaGF2ZSBhcyB1c3VhbC4KPj4+Pj4+Cj4+
Pj4+PiBJIGd1ZXNzIHRoaXMgbWF5IGJlIGhlbHBmdWwgZm9yIExpbnV4IGRlc2t0b3AgZGlzdHJv
cyBzaW5jZSB0aGVyZSBpcwo+Pj4+Pj4gbm8gc3VjaCBzdG9yYWdlIHNlcnZpY2UgdHJpZ2dlciBn
Y191cmdlbnQuCj4+Pj4+Pgo+Pj4+Pgo+Pj4+PiBUaGF0IGluZGVlZCBzb3VuZHMgaW50ZXJlc3Rp
bmcuCj4+Pj4+Cj4+Pj4+IElmIHlvdSBuZWVkIG1lIHRvIHRlc3Qgc29tZXRoaW5nIG91dCwgZmVl
bCBmcmVlIHRvIGFzay4KPj4+Pgo+Pj4+IFRoYW5rcyBhIGxvdCBmb3IgdGhhdC4gOikKPj4+Pgo+
Pj4+IEknbSB0cnlpbmcgdG8gZmlndXJlIG91dCBhIHBhdGNoLi4uCj4+Cj4+IEp1aHl1bmcsCj4+
Cj4+IEFyZSB5b3UgaW50ZXJlc3RpbmcgdG8gdHJ5IHRoaXMgcGF0Y2ggaW4gZGlzdHJvcz8KPj4K
Pj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvY2hhby9s
aW51eC5naXQvY29tbWl0Lz9oPWRldi10ZXN0JmlkPTQ3MzZlNTViYzk2N2U5MWNmOGEyNzViNjc4
NzM5YjAwNmMyNjE3ZjAKPj4KPj4gVGhlcmUgYXJlIHNvbWUgdHVuYWJsZSBwYXJhbWV0ZXJzLCBJ
IGNhbiBleHBvcnQgdGhlbSB2aWEgc3lzZnMgZW50cnksCj4+IGxldCBtZSB1cGRhdGUgbGF0ZXIu
Cj4+Cj4+IFRoYW5rcywKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9s
aXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
