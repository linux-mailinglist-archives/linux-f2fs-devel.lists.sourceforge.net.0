Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E92AFDC89
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Jul 2025 02:48:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WMVZAfRJRyb2u2z53oO3jsdJpL/GklYbn1ZCzmgQ1Tk=; b=WBVCydpPZiMES3K5t7kTFvx8xn
	lphbcxDY6SdQhBeyP8ElJhWR4U9LHNA7K2tzEy/0/ExOq4bH4XyYCmGjr89oO3hRUgZ8vCJ2TrtKm
	Fjn0Ke+Bd3mop79GQTgtjhq112Oom/wHkA9CgalIfx5yhmr2saKLnsN11I9rh7N6Vk3w=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZIzO-000606-9u;
	Wed, 09 Jul 2025 00:48:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kent.overstreet@linux.dev>) id 1uZIzM-000600-Gd
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Jul 2025 00:48:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d/YwkKFMo8ji56wMQZrrfvtyN8Ysc1/P37tA3zF0r9A=; b=mzzb5xQj/soGYHNcoLltwwRAmn
 Q4FYrSHDsnpX3LoOSC31VXwOKnu9DPxRmDXhR/UGR5COFq1vqEVLbO6eoyFh52GggZyF8yClfsQBW
 sNU6BlpQXV0EzNS2wry2T0K2hvk+BTlFo4gW1sOojbjzUYKHHSwLUEwEc4SbKpCIKeRY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=d/YwkKFMo8ji56wMQZrrfvtyN8Ysc1/P37tA3zF0r9A=; b=I4+mXGjn0wRsk2svfdpsGlbhyD
 fPYC+D9/kDShuZJvz2ZF3zfcVwhejwM6DVNlfjG7Sg5w7hMc8C+OJVC/LaVIDjfa68nvvmvMaIaj4
 G3EDU7UpZ77FEWDVinuACuPvDytIHg63WP6K8Th7KstIXa+BuNMqp3YjQlALn7K21glk=;
Received: from out-182.mta1.migadu.com ([95.215.58.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZIzL-0002zj-4l for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Jul 2025 00:48:44 +0000
Date: Tue, 8 Jul 2025 20:35:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1752021353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d/YwkKFMo8ji56wMQZrrfvtyN8Ysc1/P37tA3zF0r9A=;
 b=EZTkqClqL7e+ujm8CzLoqDaI+JHH9gO3M8nHG2sNs4Po8mSQx70Qg+BaKk0HywM52C/SNm
 7Jlj7CJffhurRND2JMfWCSZ7o5NP0fHzR1n6UTdko0ldi1yEFBbY3XG3gKnMX4RNhRPAJj
 tKW8f6XKSd1wuGDYZi1GvflRpevJ0t8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Qu Wenruo <quwenruo.btrfs@gmx.com>
Message-ID: <lcbj2r4etktljckyv3q4mgryvwqsbl7pwe6sqdtyfwgmunhkov@4oinzvvnt44s>
References: <cover.1751589725.git.wqu@suse.com>
 <de25bbdb572c75df38b1002d3779bf19e3ad0ff6.1751589725.git.wqu@suse.com>
 <aGxSHKeyldrR1Q0T@dread.disaster.area>
 <dbd955f7-b9b4-402f-97bf-6b38f0c3237e@gmx.com>
 <20250708004532.GA2672018@frogsfrogsfrogs>
 <20250708-geahndet-rohmaterial-0419fd6a76b3@brauner>
 <aG2i3qP01m-vmFVE@dread.disaster.area>
 <00f5c2a2-4216-4eeb-b555-ef49f8cfd447@gmx.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <00f5c2a2-4216-4eeb-b555-ef49f8cfd447@gmx.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Wed, Jul 09, 2025 at 08:37:05AM +0930, Qu Wenruo wrote:
    > 在 2025/7/9 08:29, Dave Chinner 写道: > > On Tue, Jul 08, 2025 at 09:55:14AM
    +0200, Christian Brauner wrote: > > > On Mon, Jul 07, 2025 [...] 
 
 Content analysis details:   (-0.2 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
X-Headers-End: 1uZIzL-0002zj-4l
Subject: Re: [f2fs-dev] [PATCH v4 1/6] fs: enhance and rename shutdown()
 callback to remove_bdev()
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
Cc: Christian Brauner <brauner@kernel.org>, ntfs3@lists.linux.dev, jack@suse.cz,
 "Darrick J. Wong" <djwong@kernel.org>, Dave Chinner <david@fromorbit.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Qu Wenruo <wqu@suse.com>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org,
 viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gV2VkLCBKdWwgMDksIDIwMjUgYXQgMDg6Mzc6MDVBTSArMDkzMCwgUXUgV2VucnVvIHdyb3Rl
Ogo+IOWcqCAyMDI1LzcvOSAwODoyOSwgRGF2ZSBDaGlubmVyIOWGmemBkzoKPiA+IE9uIFR1ZSwg
SnVsIDA4LCAyMDI1IGF0IDA5OjU1OjE0QU0gKzAyMDAsIENocmlzdGlhbiBCcmF1bmVyIHdyb3Rl
Ogo+ID4gPiBPbiBNb24sIEp1bCAwNywgMjAyNSBhdCAwNTo0NTozMlBNIC0wNzAwLCBEYXJyaWNr
IEouIFdvbmcgd3JvdGU6Cj4gPiA+ID4gT24gVHVlLCBKdWwgMDgsIDIwMjUgYXQgMDg6NTI6NDdB
TSArMDkzMCwgUXUgV2VucnVvIHdyb3RlOgo+ID4gPiA+ID4gCj4gPiA+ID4gPiAKPiA+ID4gPiA+
IOWcqCAyMDI1LzcvOCAwODozMiwgRGF2ZSBDaGlubmVyIOWGmemBkzoKPiA+ID4gPiA+ID4gT24g
RnJpLCBKdWwgMDQsIDIwMjUgYXQgMTA6MTI6MjlBTSArMDkzMCwgUXUgV2VucnVvIHdyb3RlOgo+
ID4gPiA+ID4gPiA+IEN1cnJlbnRseSBhbGwgdGhlIGZpbGVzeXN0ZW1zIGltcGxlbWVudGluZyB0
aGUKPiA+ID4gPiA+ID4gPiBzdXBlcl9vcGVhcmF0aW9uczo6c2h1dGRvd24oKSBjYWxsYmFjayBj
YW4gbm90IGFmZm9yZCBsb3NpbmcgYSBkZXZpY2UuCj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+
ID4gVGh1cyBmc19iZGV2X21hcmtfZGVhZCgpIHdpbGwganVzdCBjYWxsIHRoZSBzaHV0ZG93bigp
IGNhbGxiYWNrIGZvciB0aGUKPiA+ID4gPiA+ID4gPiBpbnZvbHZlZCBmaWxlc3lzdGVtLgo+ID4g
PiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IEJ1dCBpdCB3aWxsIG5vIGxvbmdlciBiZSB0aGUgY2Fz
ZSwgd2l0aCBtdWx0aS1kZXZpY2UgZmlsZXN5c3RlbXMgbGlrZQo+ID4gPiA+ID4gPiA+IGJ0cmZz
IGFuZCBiY2FjaGVmcyB0aGUgZmlsZXN5c3RlbSBjYW4gaGFuZGxlIGNlcnRhaW4gZGV2aWNlIGxv
c3Mgd2l0aG91dAo+ID4gPiA+ID4gPiA+IHNodXR0aW5nIGRvd24gdGhlIHdob2xlIGZpbGVzeXN0
ZW0uCj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gVG8gYWxsb3cgdGhvc2UgbXVsdGktZGV2
aWNlIGZpbGVzeXN0ZW1zIHRvIGJlIGludGVncmF0ZWQgdG8gdXNlCj4gPiA+ID4gPiA+ID4gZnNf
aG9sZGVyX29wczoKPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiAtIFJlcGxhY2Ugc3VwZXJf
b3BlYXJhdGlvbjo6c2h1dGRvd24oKSB3aXRoCj4gPiA+ID4gPiA+ID4gICAgIHN1cGVyX29wZWFy
YXRpb25zOjpyZW1vdmVfYmRldigpCj4gPiA+ID4gPiA+ID4gICAgIFRvIGJldHRlciBkZXNjcmli
ZSB3aGVuIHRoZSBjYWxsYmFjayBpcyBjYWxsZWQuCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBU
aGlzIGNvbmZsYXRlcyBjYXVzZSB3aXRoIGFjdGlvbi4KPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+
IFRoZSBzaHV0ZG93biBjYWxsb3V0IGlzIGFuIGFjdGlvbiB0aGF0IHRoZSBmaWxlc3lzdGVtIG11
c3QgZXhlY3V0ZSwKPiA+ID4gPiA+ID4gd2hpbHN0ICJyZW1vdmUgYmRldiIgaXMgYSBjYXVzZSBu
b3RpZmljYXRpb24gdGhhdCBtaWdodCByZXF1aXJlIGFuCj4gPiA+ID4gPiA+IGFjdGlvbiB0byBi
ZSB0YWtlLgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gWWVzLCB0aGUgY2F1c2UgY291bGQgYmUg
c29tZW9uZSBkb2luZyBob3QtdW5wbHVnIG9mIHRoZSBibG9jawo+ID4gPiA+ID4gPiBkZXZpY2Us
IGJ1dCBpdCBjb3VsZCBhbHNvIGJlIHNvbWV0aGluZyBnb2luZyB3cm9uZyBpbiBzb2Z0d2FyZQo+
ID4gPiA+ID4gPiBsYXllcnMgYmVsb3cgdGhlIGZpbGVzeXN0ZW0uIGUuZy4gZG0tdGhpbnAgaGF2
aW5nIGFuIHVucmVjb3ZlcmFibGUKPiA+ID4gPiA+ID4gY29ycnVwdGlvbiBvciBFTk9TUEMgZXJy
b3JzLgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gV2UgYWxyZWFkeSBoYXZlIGEgImNhdXNlIiBu
b3RpZmljYXRpb246IGJsa19ob2xkZXJfb3BzLT5tYXJrX2RlYWQoKS4KPiA+ID4gPiA+ID4gCj4g
PiA+ID4gPiA+IFRoZSBnZW5lcmljIGZzIGFjdGlvbiB0aGF0IGlzIHRha2VuIGJ5IHRoaXMgbm90
aWZpY2F0aW9uIGlzCj4gPiA+ID4gPiA+IGZzX2JkZXZfbWFya19kZWFkKCkuICBUaGF0IGFjdGlv
biBpcyB0byBpbnZhbGlkYXRlIGNhY2hlcyBhbmQgc2h1dAo+ID4gPiA+ID4gPiBkb3duIHRoZSBm
aWxlc3lzdGVtLgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gYnRyZnMgbmVlZHMgdG8gZG8gc29t
ZXRoaW5nIGRpZmZlcmVudCB0byBhIGJsa19ob2xkZXJfb3BzLT5tYXJrX2RlYWQKPiA+ID4gPiA+
ID4gbm90aWZpY2F0aW9uLiBpLmUuIGl0IG5lZWRzIGFuIGFjdGlvbiB0aGF0IGlzIGRpZmZlcmVu
dCB0bwo+ID4gPiA+ID4gPiBmc19iZGV2X21hcmtfZGVhZCgpLgo+ID4gPiA+ID4gPiAKPiA+ID4g
PiA+ID4gSW5kZWVkLCB0aGlzIGlzIGhvdyBiY2FjaGVmcyBhbHJlYWR5IGhhbmRsZXMgInNpbmds
ZSBkZXZpY2UKPiA+ID4gPiA+ID4gZGllZCIgZXZlbnRzIGZvciBtdWx0aS1kZXZpY2UgZmlsZXN5
c3RlbXMgLSBzZWUKPiA+ID4gPiA+ID4gYmNoMl9mc19iZGV2X21hcmtfZGVhZCgpLgo+ID4gPiA+
ID4gCj4gPiA+ID4gPiBJIGRvIG5vdCB0aGluayBpdCdzIHRoZSBjb3JyZWN0IHdheSB0byBnbywg
ZXNwZWNpYWxseSB3aGVuIHRoZXJlIGlzIGFscmVhZHkKPiA+ID4gPiA+IGZzX2hvbGRlcl9vcHMu
Cj4gPiA+ID4gPiAKPiA+ID4gPiA+IFdlJ3JlIGFsd2F5cyBnb2luZyB0b3dhcmRzIGEgbW9yZSBn
ZW5lcmljIHNvbHV0aW9uLCBvdGhlciB0aGFuIGxldHRpbmcgdGhlCj4gPiA+ID4gPiBpbmRpdmlk
dWFsIGZzIHRvIGRvIHRoZSBzYW1lIHRoaW5nIHNsaWdodGx5IGRpZmZlcmVudGx5Lgo+ID4gPiA+
IAo+ID4gPiA+IE9uIHNlY29uZCB0aG91Z2h0IC0tIGl0J3Mgd2VpcmQgdGhhdCB5b3UnZCBmbHVz
aCB0aGUgZmlsZXN5c3RlbSBhbmQKPiA+ID4gPiBzaHJpbmsgdGhlIGlub2RlL2RlbnRyeSBjYWNo
ZXMgaW4gYSAieW91ciBkZXZpY2Ugd2VudCBhd2F5IiBoYW5kbGVyLgo+ID4gPiA+IEZhbmN5IGZp
bGVzeXN0ZW1zIGxpa2UgYmNhY2hlZnMgYW5kIGJ0cmZzIHdvdWxkIGxpa2VseSBqdXN0IHNoaWZ0
IElPIHRvCj4gPiA+ID4gYSBkaWZmZXJlbnQgYmRldiwgcmlnaHQ/ICBBbmQgdGhlcmUncyBubyBn
b29kIHJlYXNvbiB0byBydW4gc2hyaW5rZXJzIG9uCj4gPiA+ID4gZWl0aGVyIG9mIHRob3NlIGZz
ZXMsIHJpZ2h0Pwo+ID4gPiA+IAo+ID4gPiA+ID4gWWVzLCB0aGUgbmFtaW5nIGlzIG5vdCBwZXJm
ZWN0IGFuZCBtaXhpbmcgY2F1c2UgYW5kIGFjdGlvbiwgYnV0IHRoZSBlbmQKPiA+ID4gPiA+IHJl
c3VsdCBpcyBzdGlsbCBhIG1vcmUgZ2VuZXJpYyBhbmQgbGVzcyBkdXBsaWNhdGVkIGNvZGUgYmFz
ZS4KPiA+ID4gPiAKPiA+ID4gPiBJIHRoaW5rIGRjaGlubmVyIG1ha2VzIGEgZ29vZCBwb2ludCB0
aGF0IGlmIHlvdXIgZmlsZXN5c3RlbSBjYW4gZG8KPiA+ID4gPiBzb21ldGhpbmcgY2xldmVyIG9u
IGRldmljZSByZW1vdmFsLCBpdCBzaG91bGQgcHJvdmlkZSBpdHMgb3duIGJsb2NrCj4gPiA+ID4g
ZGV2aWNlIGhvbGRlciBvcHMgaW5zdGVhZCBvZiB1c2luZyBmc19ob2xkZXJfb3BzLiAgSSBkb24n
dCB1bmRlcnN0YW5kCj4gPiA+ID4gd2h5IHlvdSBuZWVkIGEgImdlbmVyaWMiIHNvbHV0aW9uIGZv
ciBidHJmcyB3aGVuIGl0J3Mgbm90IGdvaW5nIHRvIGRvCj4gPiA+ID4gd2hhdCB0aGUgb3RoZXJz
IGRvIGFueXdheS4KPiA+ID4gCj4gPiA+IEkgdGhpbmsgbGV0dGluZyBmaWxlc3lzdGVtcyBpbXBs
ZW1lbnQgdGhlaXIgb3duIGhvbGRlciBvcHMgc2hvdWxkIGJlCj4gPiA+IGF2b2lkZWQgaWYgd2Ug
Y2FuLiBDaHJpc3RvcGggbWF5IGNoaW1lIGluIGhlcmUuIEkgaGF2ZSBubyBhcHBldHRpdGUgZm9y
Cj4gPiA+IGV4cG9ydGluZyBzdHVmZiBsaWtlIGdldF9iZGV2X3N1cGVyKCkgdW5sZXNzIGFic29s
dXRlbHkgbmVjZXNzYXJ5LiBXZQo+ID4gPiB0cmllZCB0byBtb3ZlIGFsbCB0aGF0IGhhbmRsaW5n
IGludG8gdGhlIFZGUyB0byBlbGltaW5hdGUgYSBzbGV3IG9mCj4gPiA+IGRlYWRsb2NrcyB3ZSBk
ZXRlY3RlZCBhbmQgZml4ZWQuIEkgaGF2ZSBubyBhcHBldGl0ZSB0byByZXBlYXQgdGhhdAo+ID4g
PiBjeWNsZS4KPiA+IAo+ID4gRXhjZXB0IGl0IGlzbid0IGFjdHVhbGx5IG5lY2Vzc2FyeS4KPiA+
IAo+ID4gRXZlcnlvbmUgaGVyZSBzZWVtcyB0byBiZSBhc3N1bWluZyB0aGF0IHRoZSBmaWxlc3lz
dGVtICptdXN0KiB0YWtlCj4gPiBhbiBhY3RpdmUgc3VwZXJibG9jayByZWZlcmVuY2UgdG8gcHJv
Y2VzcyBhIGRldmljZSByZW1vdmFsIGV2ZW50LAo+ID4gYW5kIHRoYXQgaXMgKnNpbXBseSBub3Qg
dHJ1ZSouCj4gPiAKPiA+IGJjYWNoZWZzIGRvZXMgbm90IHVzZSBnZXRfYmRldl9zdXBlcigpIG9y
IGFuIGFjdGl2ZSBzdXBlcmJsb2NrCj4gPiByZWZlcmVuY2UgdG8gcHJvY2VzcyAtPm1hcmtfZGVh
ZCBldmVudHMuCj4gCj4gWWVzLCBiY2FjaGVmcyBkb2Vzbid0IGdvIHRoaXMgcGF0aCwgYnV0IHRo
ZSByZWFzb24gaXMgbW9yZSBpbXBvcnRhbnQuCj4gCj4gSXMgaXQganVzdCBiZWNhdXNlIHRoZXJl
IGlzIG5vIHN1Y2ggY2FsbGJhY2sgc28gdGhhdCBLZW50IGhhcyB0byBjb21lIHVwIGhpcwo+IG93
biBzb2x1dGlvbiwgb3Igc29tZXRoaW5nIGVsc2U/Cj4gCj4gSWYgdGhlIGZvcm1lciBjYXNlLCBh
bGwgeW91ciBhcmd1bWVudCBoZXJlIG1ha2VzIG5vIHNlbnNlLgo+IAo+IEFkZGluZyBLZW50IGhl
cmUgdG8gc2VlIGlmIGhlIHdhbnRzIGEgbW9yZSBnZW5lcmljIHNfb3AtPnJlbW92ZV9iZGV2KCkK
PiBzb2x1dGlvbiBvciB0aGUgY3VycmVudCBlYWNoIGZzIGRvaW5nIGl0cyBvd24gbWFya19kZWFk
KCkgY2FsbGJhY2suCgpDb25zaWRlciB0aGF0IHRoZSB0aGluZyB0aGF0IGhhcyBhIGJsb2NrIGRl
dmljZSBvcGVuIG1pZ2h0IG5vdCBldmVuIGJlIGEKZmlsZXN5c3RlbSwgb3IgYXQgbGVhc3QgYSBW
RlMgZmlsZXN5c3RlbS4KCkl0IGNvdWxkIGJlIGEgc3RhY2tpbmcgYmxvY2sgZGV2aWNlIGRyaXZl
ciAtIG1kIG9yIG1kIC0gYW5kIHRob3NlCmFic29sdXRlbHkgc2hvdWxkIGJlIGltcGxlbWVudGlu
ZyAubWFya19kZWFkKCkgKGxpa2VseSBwYXNzaW5nIGl0CnRocm91Z2ggb24gdXAgdGhlIHN0YWNr
KSwgb3Igc29tZXRoaW5nIGVsc2UgZW50aXJlbHkuCgpJbiBiY2FjaGVmcydzIGNhc2UsIHdlIG1p
Z2h0IG5vdCBldmVuIGhhdmUgY3JlYXRlZCB0aGUgVkZTIHN1cGVyX2Jsb2NrCnlldDogd2UgZG9u
J3QgZG8gdGhhdCB1bnRpbCBhZnRlciByZWNvdmVyeSBmaW5pc2hlcywgYW5kIGluZGVlZCB3ZSBj
YW4ndApiZWNhdXNlIGNyZWF0aW5nIGEgc3VwZXJfYmxvY2sgYW5kIGxlYXZpbmcgaXQgaW4gIVNC
X0JPUk4gd2lsbCBjYXVzZQpzdWNoIGZ1biBhcyBzeW5jIGNhbGxzIHRvIGhhbmcgZm9yIHRoZSBl
bnRpcmUgc3lzdGVtLi4uCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMv
bGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
