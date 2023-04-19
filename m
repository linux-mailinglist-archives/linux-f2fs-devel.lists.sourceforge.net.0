Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2D46E7E4B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Apr 2023 17:31:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pp9lo-0006WT-OO;
	Wed, 19 Apr 2023 15:30:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pp9ln-0006WN-99
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 19 Apr 2023 15:30:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0fnBR63fjg8I+ttH03vi4HM7bX97ZqFKA7oIwBOt55Q=; b=VGrFk5tTjj7+LChLeGvhxRH0wi
 RfERswnaeIV2+V3ZWvGD+kH1EO+G1KW5pqkdhA8MqUDP996rTziqRkNsV76YfsdnWj6jlPdBzcaUP
 bicdC02etZhL6AJSbxA1juNafR3hfUvpBoNh35t6ae4lSvOmJFnEiWLy9xlQMHy1gF2c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0fnBR63fjg8I+ttH03vi4HM7bX97ZqFKA7oIwBOt55Q=; b=elU+d8uDtdXeG3zAMyHKU43slv
 uMzKsGJhJV1d3dcNzRwz+W+D4+Kt4mUGvB70BiiCZcEbsdG4FKuo0pVsJmwrDnU43yRgmEN1lKsTe
 RjtebK9Rgr3m1HshJINP4t7MZKWWYLt1VDgE4mzuPHuWt/JdVDCRO2nRo4wce1mpt64I=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pp9lh-0005Ui-7T for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 19 Apr 2023 15:30:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A54DF631CB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 19 Apr 2023 15:30:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A03BC433D2;
 Wed, 19 Apr 2023 15:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681918240;
 bh=JMaZwA1dCOk+ofXmP6eFP+HvsGhy7OmhboIcr8AIwVM=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=OjKokYALqdz14ovnpWb2G0lrqzwH3Y3EtIWFGljrdFfcSge7bnQPXWWQxJfex8W1l
 0P61ZJdja7F0v9+LEHFqOpf7Fb1mZ/jP9NLEXzIwaR0xJoeFJbxVcALufZO5Nt0u+9
 7ebsyUvC9VhzfsGa75Y+TxWlXxU5OSZTJtj0iVivJi7dBSvllSK8zd9oItTXkVAm0P
 6myos6Mm/2QMMYIQtvAsgo1ayN6hP0hEGVqrXUm8QLiK4uaYakH2DVLoEWwbQbLYT1
 uUGIFDAFIKnPLTDj649tg3G0869C0hOxFbKZw+ve+iqHBRSshQYlcc6v3WfyUbxRqy
 hf4CNyR0fE0Cg==
Message-ID: <18ed82d6-b191-9c04-23ac-caa0a16f263e@kernel.org>
Date: Wed, 19 Apr 2023 23:30:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230405144359.930253-1-chao@kernel.org>
 <ZDCEK2OPkhTmRZrq@google.com>
 <224e8756-7c63-fd53-a0f3-f3e2a7b4c13f@kernel.org>
 <ZDROBJFxSUdGaqAa@google.com>
 <538fd229-28ae-0ec5-ef07-35d505fbb8a9@kernel.org>
 <2341db3b-5a40-a9f0-51f1-29a8908e3e98@kernel.org>
 <ZDWUGr2c3TT2tTgu@google.com>
 <2d3125e9-0e5c-644f-1ffa-e41ba55b4ecb@kernel.org>
In-Reply-To: <2d3125e9-0e5c-644f-1ffa-e41ba55b4ecb@kernel.org>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/4/13 17:49, Chao Yu wrote: > On 2023/4/12 1:08,
 Jaegeuk
 Kim wrote: >> On 04/11, Chao Yu wrote: >>> On 2023/4/11 16:14, Chao Yu wrote:
 >>>> On 2023/4/11 1:57, Jaegeuk Kim wrote: >>>>> On 04/08, [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pp9lh-0005Ui-7T
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to tag FIEMAP_EXTENT_DELALLOC in
 fiemap() for delay allocated extent
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMy80LzEzIDE3OjQ5LCBDaGFvIFl1IHdyb3RlOgo+IE9uIDIwMjMvNC8xMiAxOjA4LCBK
YWVnZXVrIEtpbSB3cm90ZToKPj4gT24gMDQvMTEsIENoYW8gWXUgd3JvdGU6Cj4+PiBPbiAyMDIz
LzQvMTEgMTY6MTQsIENoYW8gWXUgd3JvdGU6Cj4+Pj4gT24gMjAyMy80LzExIDE6NTcsIEphZWdl
dWsgS2ltIHdyb3RlOgo+Pj4+PiBPbiAwNC8wOCwgQ2hhbyBZdSB3cm90ZToKPj4+Pj4+IE9uIDIw
MjMvNC84IDQ6NTksIEphZWdldWsgS2ltIHdyb3RlOgo+Pj4+Pj4+IFRoaXMgYnJlYWtzIGdlbmVy
aWMvMDA5Pwo+Pj4+Pj4KPj4+Pj4+IEkgZ3Vlc3MgaXQgaXMgYXMgZXhwZWN0ZWQ/Cj4+Pj4+Pgo+
Pj4+Pj4gUGxlYXNlIGNoZWNrIGRlc2NyaXB0aW9uIG9mIGZpZW1hcCBpb2N0bCBtYW51YWwgZnJv
bSBbMV06Cj4+Pj4+Pgo+Pj4+Pj4gRklFTUFQX0VYVEVOVF9VTktOT1dOCj4+Pj4+PiBUaGUgbG9j
YXRpb24gb2YgdGhpcyBleHRlbnQgaXMgY3VycmVudGx5IHVua25vd24uIFRoaXMgbWF5Cj4+Pj4+
PiBpbmRpY2F0ZSB0aGUgZGF0YSBpcyBzdG9yZWQgb24gYW4gaW5hY2Nlc3NpYmxlIHZvbHVtZSBv
ciB0aGF0Cj4+Pj4+PiBubyBzdG9yYWdlIGhhcyBiZWVuIGFsbG9jYXRlZCBmb3IgdGhlIGZpbGUg
eWV0Lgo+Pj4+Pj4KPj4+Pj4+IEZJRU1BUF9FWFRFTlRfREVMQUxMT0MKPj4+Pj4+IFRoaXMgd2ls
bCBhbHNvIHNldCBGSUVNQVBfRVhURU5UX1VOS05PV04uCj4+Pj4+Pgo+Pj4+Pj4gRGVsYXllZCBh
bGxvY2F0aW9uIC0gd2hpbGUgdGhlcmUgaXMgZGF0YSBmb3IgdGhpcyBleHRlbnQsIGl0cwo+Pj4+
Pj4gcGh5c2ljYWwgbG9jYXRpb24gaGFzIG5vdCBiZWVuIGFsbG9jYXRlZCB5ZXQuCj4+Pj4+Pgo+
Pj4+Pj4gRklFTUFQX0VYVEVOVF9VTldSSVRURU4KPj4+Pj4+IFVud3JpdHRlbiBleHRlbnQgLSB0
aGUgZXh0ZW50IGlzIGFsbG9jYXRlZCBidXQgaXRzIGRhdGEgaGFzIG5vdAo+Pj4+Pj4gYmVlbiBp
bml0aWFsaXplZC4gVGhpcyBpbmRpY2F0ZXMgdGhlIGV4dGVudOKAmXMgZGF0YSB3aWxsIGJlIGFs
bAo+Pj4+Pj4gemVybyBpZiByZWFkIHRocm91Z2ggdGhlIGZpbGVzeXN0ZW0gYnV0IHRoZSBjb250
ZW50cyBhcmUgdW5kZWZpbmVkCj4+Pj4+PiBpZiByZWFkIGRpcmVjdGx5IGZyb20gdGhlIGRldmlj
ZS4KPj4+Pj4+Cj4+Pj4+PiBbMV0gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC9sYXRl
c3QvZmlsZXN5c3RlbXMvZmllbWFwLmh0bWwKPj4+Pj4+Cj4+Pj4+PiBBY2NvcmRpbmcgdG8gaXRz
IGRlc2NyaXB0aW9uLCBmMmZzIG9ubHkgc3VwcG9ydAo+Pj4+Pj4gRklFTUFQX0VYVEVOVF97VU5L
Tk9XTiwgREVMQUxMT0N9LCBidXQgbm90IHN1cHBvcnQKPj4+Pj4+IEZJRU1BUF9FWFRFTlRfVU5X
UklUVEVOLgo+Pj4+Pgo+Pj4+PiBObywgSSBkb24ndCB0aGluayBzby4KPj4+Pgo+Pj4+IEphZWdl
dWssCj4+Pj4KPj4+PiBDb3VsZCB5b3UgcGxlYXNlIGNoZWNrIHRoZSBkZXRhaWxlZCBkZXNjcmlw
dGlvbiBvZiBGSUVNQVBfRVhURU5UX1VOV1JJVFRFTj8KPj4+PiBUaGUgZmxhZyBpbmRpY2F0ZXMg
dHdvIGNvbmRpdGlvbnM6Cj4+Pj4gMS4gb24tZGlzayBibGthZGRycyB3ZXJlIGFsbG9jYXRlZCBm
b3IgZXh0ZW50LCBhbmQgdGhlIGV4dGVudCBpcyB0YWdnZWQgYXMKPj4+PiB1bndyaXR0ZW4gc3Rh
dHVzLgo+Pj4+IDIuIGRhdGEgcmVhZGVkIG9uIHRob3NlIGJsb2NrcyB3aWxsIGJlIGFsbCB6ZXJv
Lgo+Pj4KPj4+IFNvcnJ5LCBJIG1lYW46Cj4+Pgo+Pj4gMS4gb24tZGlzayBibGthZGRycyB3ZXJl
IGFsbG9jYXRlZCBmb3IgZXh0ZW50Owo+Pj4gMi4gZXh0ZW50IGlzIHRhZ2dlZCBhcyB1bndyaXR0
ZW4gc3RhdHVzLCBkYXRhIHJlYWRlZCBvbiB0aG9zZSBibG9ja3Mgd2lsbCBiZQo+Pj4gYWxsIHpl
cm8uCj4+Cj4+IEkgd2FzIHRoaW5raW5nIGZhbGxvY2F0ZS9waW4gY2FzZXMgdG8gZ2l2ZSB6ZXJv
IGRhdGEuIEJ1dCwgd2UgbWF5IG5lZWQgdG8gY2hlY2sKPj4gdGhlIHNwYWNlIGRpc2NhcmRlZCBz
ZWN1cmVseSBvciBkaXNrIHN1cHBvcnQ/Cj4gCj4gSSB0aG91Z2h0IGFib3V0IHNpbWlsYXIgc2No
ZW1lLCB3ZSBjYW4gYWRkIEYyRlNfR0VUX0JMT0NLX1pFUk8gZm9yIGZhbGxvY2F0ZS9waW4KPiBj
YXNlIHRvIHplcm8gZGF0YSBpbiB2YWxpZCBibG9jayBhZGRyZXNzLCBidXQgdGhlIHByb2JsZW0g
aXMgaG93IGNhbiB3ZSBkaXN0aW5ndWlzaAo+IHplcm8vdmFsaWQgZGF0YSBmcm9tIHZhbGlkIGJs
b2NrIGFkZHJlc3Mgdy9vIGFkZGl0aW9uYWwgdW53cml0dGVuIGZsYWcgb2YgbWV0YWRhdGEuCj4g
Cj4gZS5nLgo+IDEuIHdyaXRlIHBhZ2UgWzAsNTExXSB3LyB2YWxpZCBkYXRhOwo+IDIuIGZhbGxv
Y2F0ZS9waW4gcGFnZSBbNTEyLDEwMjNdIHcvIHplcm8gZGF0YTsKPiAzLiBmaWVtYXAgZmlsZSAg
LS0tIHdoYXQgb3V0cHV0IHNob3VsZCBpdCBiZT8KClRob3VnaHRzPwoKVGhhbmtzLAoKPiAKPiBU
aGFua3MsCj4gCj4+Cj4+Pgo+Pj4gVGhhbmtzLAo+Pj4KPj4+Pgo+Pj4+IFNvLCBsZXQncyBjaGVj
ayBmMmZzJyBzdGF0dXM6Cj4+Pj4gLSBmYWxsb2NhdGUgb25seSByZXNlcnZlIHZhbGlkIGJsb2Nr
IGNvdW50IGFuZCBzZXQgTkVXX0FERFIgaW4gZG5vZGUsIHNvCj4+Pj4gaXQgZG9lcyBub3QgbWF0
Y2ggY29uZGl0aW9uIDEpCj4+Pj4gLSBwaW4gJiBmYWxsb2NhdGUgcHJlYWxsb2NhdGVzIGJsa2Fk
ZHJzIGFuZCBzZXQgYmxrYWRkcnMgaW4gZG5vZGUsIGJ1dAo+Pj4+IGNvbnRlbnQgb24gdGhvc2Ug
YmxrYWRkcnMgbWF5IGNvbnRhaW4gemVybyBvciByYW5kb20gZGF0YSwgc28gaXQgZG9lcyBub3QK
Pj4+PiBtYXRjaMKgIGNvbmRpdGlvbiAyKQo+Pj4+Cj4+Pj4gQ2hyaXN0b3BoIGRlc2NyaWJlcyB0
aGlzIGlzc3VlIGluIGJlbG93IHBhdGNoIGFzIHdlbGwsIHlvdSBjYW4gY2hlY2sgaXQuCj4+Pj4g
ZGE4YzdmZWNjOWM3ICgiZjJmczogcmVuYW1lIEYyRlNfTUFQX1VOV1JJVFRFTiB0byBGMkZTX01B
UF9ERUxBTExPQyIpCj4+Pj4KPj4+PiBBbSBJIG1pc3Npbmcgc29tZXRoaW5nPwo+Pj4+Cj4+Pj4g
VGhhbmtzLAo+Pj4+Cj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gU28gMDA5LCAwOTIsIDA5NCAuLiB3aGlj
aCBleHBlY3RzIHVud3JpdHRlbiBzdGF0dXMgZnJvbSBleHRlbnQgd2lsbAo+Pj4+Pj4gZmFpbC4K
Pj4+Pj4+Cj4+Pj4+PiBIb3cgYWJvdXQgZGlzYWJsaW5nIHRob3NlIHRlc3RjYXNlPwo+Pj4+Pj4K
Pj4+Pj4+IFRoYW5rcywKPj4+Pj4+Cj4+Pj4+Pj4KPj4+Pj4+PiBPbiAwNC8wNSwgQ2hhbyBZdSB3
cm90ZToKPj4+Pj4+Pj4geGZzdGVzdCBnZW5lcmljLzYxNCBmYWlscyB0byBydW4gZHVlIGJlbG93
IHJlYXNvbjoKPj4+Pj4+Pj4KPj4+Pj4+Pj4gZ2VuZXJpYy82MTQgMXMgLi4uIFtub3QgcnVuXSB0
ZXN0IHJlcXVpcmVzIGRlbGF5ZWQgYWxsb2NhdGlvbiBidWZmZXJlZCB3cml0ZXMKPj4+Pj4+Pj4K
Pj4+Pj4+Pj4gVGhlIHJvb3QgY2F1c2UgaXMgZjJmcyB0YWdzIHdyb25nIGZpZW1hcCBmbGFnIGZv
ciBkZWxheSBhbGxvY2F0ZWQKPj4+Pj4+Pj4gZXh0ZW50Lgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBRdW90
ZWQgZnJvbSBmaWVtYXAuaDoKPj4+Pj4+Pj4gRklFTUFQX0VYVEVOVF9VTktOT1dOwqDCoMKgwqDC
oMKgwqAgMHgwMDAwMDAwMiAvKiBEYXRhIGxvY2F0aW9uIHVua25vd24uICovCj4+Pj4+Pj4+IEZJ
RU1BUF9FWFRFTlRfREVMQUxMT0PCoMKgwqDCoMKgwqDCoCAweDAwMDAwMDA0IC8qIExvY2F0aW9u
IHN0aWxsIHBlbmRpbmcuCj4+Pj4+Pj4+ICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogU2V0cyBFWFRFTlRfVU5LTk9XTi4gKi8KPj4+Pj4+
Pj4gRklFTUFQX0VYVEVOVF9VTldSSVRURU7CoMKgwqDCoMKgwqDCoCAweDAwMDAwODAwIC8qIFNw
YWNlIGFsbG9jYXRlZCwgYnV0Cj4+Pj4+Pj4+ICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogbm8gZGF0YSAoaS5lLiB6ZXJvKS4gKi8KPj4+
Pj4+Pj4KPj4+Pj4+Pj4gRklFTUFQX0VYVEVOVF9VTldSSVRURU4gbWVhbnMgYmxvY2sgYWRkcmVz
cyBpcyBwcmVhbGxvY2F0ZWQsIGJ1dCB3L28KPj4+Pj4+Pj4gYmVlbiB3cml0dGVuIGFueSBkYXRh
LCB3aGljaCBzdGF0dXMgZjJmcyBpcyBub3Qgc3VwcG9ydGVkIG5vdywgZm9yIGFsbAo+Pj4+Pj4+
PiBORVdfQUREUiBibG9jayBhZGRyZXNzZXMsIGl0IG1lYW5zIGRlbGF5IGFsbG9jYXRlZCBibG9j
a3MsIHNvIGxldCdzCj4+Pj4+Pj4+IHRhZyBGSUVNQVBfRVhURU5UX0RFTEFMTE9DIGluc3RlYWQu
Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFRlc3RjYXNlOgo+Pj4+Pj4+PiB4ZnNfaW8gLWYgLWMgJ3B3cml0
ZSAwIDY0aycgL21udC9mMmZzL2ZpbGU7Cj4+Pj4+Pj4+IGZpbGVmcmFnIC12IC9tbnQvZjJmcy9m
aWxlCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IE91dHB1dDoKPj4+Pj4+Pj4gLSBCZWZvcmUKPj4+Pj4+Pj4g
RmlsZXN5c3RlbSB0eXBlIGlzOiBmMmY1MjAxMAo+Pj4+Pj4+PiBGaXplIG9mIC9tbnQvZjJmcy9m
aWxlIGlzIDY1NTM2ICgxNiBibG9ja3Mgb2YgNDA5NiBieXRlcykKPj4+Pj4+Pj4gICDCoMKgIGV4
dDrCoMKgwqDCoCBsb2dpY2FsX29mZnNldDrCoMKgwqDCoMKgwqDCoCBwaHlzaWNhbF9vZmZzZXQ6
IGxlbmd0aDrCoMKgIGV4cGVjdGVkOiBmbGFnczoKPj4+Pj4+Pj4gICDCoMKgwqDCoCAwOsKgwqDC
oMKgwqDCoMKgIDAuLsKgwqDCoMKgwqAgMTU6wqDCoMKgwqDCoMKgwqDCoMKgIDAuLsKgwqDCoMKg
wqDCoMKgIDE1OsKgwqDCoMKgIDE2OsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsYXN0LHVud3Jp
dHRlbixtZXJnZWQsZW9mCj4+Pj4+Pj4+IC9tbnQvZjJmcy9maWxlOiAxIGV4dGVudCBmb3VuZAo+
Pj4+Pj4+Pgo+Pj4+Pj4+PiBBZnRlcjoKPj4+Pj4+Pj4gRmlsZXN5c3RlbSB0eXBlIGlzOiBmMmY1
MjAxMAo+Pj4+Pj4+PiBGaWxlIHNpemUgb2YgL21udC9mMmZzL2ZpbGUgaXMgNjU1MzYgKDE2IGJs
b2NrcyBvZiA0MDk2IGJ5dGVzKQo+Pj4+Pj4+PiAgIMKgwqAgZXh0OsKgwqDCoMKgIGxvZ2ljYWxf
b2Zmc2V0OsKgwqDCoMKgwqDCoMKgIHBoeXNpY2FsX29mZnNldDogbGVuZ3RoOsKgwqAgZXhwZWN0
ZWQ6IGZsYWdzOgo+Pj4+Pj4+PiAgIMKgwqDCoMKgIDA6wqDCoMKgwqDCoMKgwqAgMC4uwqDCoMKg
wqDCoCAxNTrCoMKgwqDCoMKgwqDCoMKgwqAgMC4uwqDCoMKgwqDCoMKgwqDCoCAwOsKgwqDCoMKg
wqAgMDrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGFzdCx1bmtub3duX2xvYyxkZWxhbGxvYyxl
b2YKPj4+Pj4+Pj4gL21udC9mMmZzL2ZpbGU6IDEgZXh0ZW50IGZvdW5kCj4+Pj4+Pj4+Cj4+Pj4+
Pj4+IEZpeGVzOiA3ZjYzZWI3N2FmN2IgKCJmMmZzOiByZXBvcnQgdW53cml0dGVuIGFyZWEgaW4g
ZjJmc19maWVtYXAiKQo+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBDaGFvIFl1IDxjaGFvQGtlcm5l
bC5vcmc+Cj4+Pj4+Pj4+IC0tLQo+Pj4+Pj4+PiAgIMKgwqAgZnMvZjJmcy9kYXRhLmMgfCA3ICsr
KysrLS0KPj4+Pj4+Pj4gICDCoMKgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2RhdGEu
YyBiL2ZzL2YyZnMvZGF0YS5jCj4+Pj4+Pj4+IGluZGV4IDM1OWRlNjUwNzcyZS4uM2FmYzk3NjQ3
NDNlIDEwMDY0NAo+Pj4+Pj4+PiAtLS0gYS9mcy9mMmZzL2RhdGEuYwo+Pj4+Pj4+PiArKysgYi9m
cy9mMmZzL2RhdGEuYwo+Pj4+Pj4+PiBAQCAtMTk5NSw3ICsxOTk1LDEwIEBAIGludCBmMmZzX2Zp
ZW1hcChzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZmllbWFwX2V4dGVudF9pbmZvICpmaWVp
bmZvLAo+Pj4+Pj4+PiAgIMKgwqDCoMKgwqDCoCB9Cj4+Pj4+Pj4+ICAgwqDCoMKgwqDCoMKgIGlm
IChzaXplKSB7Cj4+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCBmbGFncyB8PSBGSUVNQVBfRVhURU5U
X01FUkdFRDsKPj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChmbGFncyAmIEZJRU1BUF9FWFRF
TlRfREVMQUxMT0MpCj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBoeXMgPSAwOwo+
Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgZWxzZQo+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBmbGFncyB8PSBGSUVNQVBfRVhURU5UX01FUkdFRDsKPj4+Pj4+Pj4gICDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBpZiAoSVNfRU5DUllQVEVEKGlub2RlKSkKPj4+Pj4+Pj4gICDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGZsYWdzIHw9IEZJRU1BUF9FWFRFTlRfREFUQV9FTkNSWVBURUQ7
Cj4+Pj4+Pj4+IEBAIC0yMDM1LDcgKzIwMzgsNyBAQCBpbnQgZjJmc19maWVtYXAoc3RydWN0IGlu
b2RlICppbm9kZSwgc3RydWN0IGZpZW1hcF9leHRlbnRfaW5mbyAqZmllaW5mbywKPj4+Pj4+Pj4g
ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2l6ZSArPSBibGtzX3RvX2J5
dGVzKGlub2RlLCAxKTsKPj4+Pj4+Pj4gICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0K
Pj4+Pj4+Pj4gICDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9IGVsc2UgaWYgKG1hcC5tX2ZsYWdzICYg
RjJGU19NQVBfREVMQUxMT0MpIHsKPj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZmxh
Z3MgPSBGSUVNQVBfRVhURU5UX1VOV1JJVFRFTjsKPj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgZmxhZ3MgPSBGSUVNQVBfRVhURU5UX0RFTEFMTE9DOwo+Pj4+Pj4+PiAgIMKgwqDCoMKg
wqDCoMKgwqDCoMKgIH0KPj4+Pj4+Pj4gICDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdGFydF9ibGsg
Kz0gYnl0ZXNfdG9fYmxrcyhpbm9kZSwgc2l6ZSk7Cj4+Pj4+Pj4+IC0tIAo+Pj4+Pj4+PiAyLjM2
LjEKPj4+Pgo+Pj4+Cj4+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPj4+PiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+Pj4+IExpbnV4LWYy
ZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4+Pj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vm
b3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo+IAo+IAo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgtZjJmcy1kZXZl
bCBtYWlsaW5nIGxpc3QKPiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+
IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMt
ZGV2ZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJj
ZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9s
aW51eC1mMmZzLWRldmVsCg==
