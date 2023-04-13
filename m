Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4316E0A8B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 Apr 2023 11:50:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pmtaV-0004KA-6x;
	Thu, 13 Apr 2023 09:49:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pmtaS-0004Ju-T4
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Apr 2023 09:49:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0Vh+ofQd+YoVpFR6hWAEn5xU3ianYfMH/SUdoDI0L2A=; b=br+zqMJUEPS5r5z5ZqxpC+3gmo
 tV9qksc0eeQSSVnNKrt28aokHeLTZ5oNnaHJvsWIOyRg5MhQIAzZJRK/VLqNJhtpie5Q7t2nPtLg8
 AsIg5BKFUTeHgLKO5lnWD+TC97ixZdeIFQUsoHCRTWcvSsNqc+OWsdNyM/4AAVYf/9sQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0Vh+ofQd+YoVpFR6hWAEn5xU3ianYfMH/SUdoDI0L2A=; b=L+Gt7QRx+9NDIgzwJiUhQT/J+c
 NXemlSosYaCDWK7nyIuzlKMaBOR9InzwClcFhuzmVDoRkVS8VYqNOLsdzEBRkhp1uX/2jo2cHmFKQ
 XlpKOtqunyCm/hpNQlE8Hc8os/accPiTMkQr8YLURsRyprXm/4qrGyH53+pafQmVFmgA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pmtaT-0001B9-0A for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Apr 2023 09:49:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7A16261290
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 13 Apr 2023 09:49:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D718C433D2;
 Thu, 13 Apr 2023 09:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681379386;
 bh=HY/kXZcilZ1kkerFOF/bqmRD+HNYACCW7VsjbHDLX28=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=aoKADtFLQGiCPztosnVzHqbcC7IHcftu+J3W38g/cQ0ylHr+oTQ6pGJbcRoFJ6j4r
 UTHzAo3ur5u6hPWiufNisGqisQIcwMy2vVQGy1tPtlJG1iCDbfSQpwUMb8NegHoUz+
 R9G1LUTr/LmLEncRZGjAHIiD9baRySNsoiDZRA0rLConsypXfjHSdEHWIs54zznEWa
 E4wtdB6dHM8DLG59/bi5oLpsksvUhzLQ4yBZqMp+poyEz21U0bRL80YdEX/k7VdDh1
 gpjyT2mYZhM27PV82Y6Z/KzoWd1W0taVjl+RCHimlyIxDDB0pITnUMNi0F8Y3fYlaO
 U0yc+41lKI3rw==
Message-ID: <2d3125e9-0e5c-644f-1ffa-e41ba55b4ecb@kernel.org>
Date: Thu, 13 Apr 2023 17:49:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230405144359.930253-1-chao@kernel.org>
 <ZDCEK2OPkhTmRZrq@google.com>
 <224e8756-7c63-fd53-a0f3-f3e2a7b4c13f@kernel.org>
 <ZDROBJFxSUdGaqAa@google.com>
 <538fd229-28ae-0ec5-ef07-35d505fbb8a9@kernel.org>
 <2341db3b-5a40-a9f0-51f1-29a8908e3e98@kernel.org>
 <ZDWUGr2c3TT2tTgu@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZDWUGr2c3TT2tTgu@google.com>
X-Spam-Score: -6.3 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/4/12 1:08, Jaegeuk Kim wrote: > On 04/11, Chao Yu
 wrote: >> On 2023/4/11 16:14, Chao Yu wrote: >>> On 2023/4/11 1:57, Jaegeuk
 Kim wrote: >>>> On 04/08, Chao Yu wrote: >>>>> On 2023/4/8 4:59, J [...] 
 Content analysis details:   (-6.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -1.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pmtaT-0001B9-0A
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

T24gMjAyMy80LzEyIDE6MDgsIEphZWdldWsgS2ltIHdyb3RlOgo+IE9uIDA0LzExLCBDaGFvIFl1
IHdyb3RlOgo+PiBPbiAyMDIzLzQvMTEgMTY6MTQsIENoYW8gWXUgd3JvdGU6Cj4+PiBPbiAyMDIz
LzQvMTEgMTo1NywgSmFlZ2V1ayBLaW0gd3JvdGU6Cj4+Pj4gT24gMDQvMDgsIENoYW8gWXUgd3Jv
dGU6Cj4+Pj4+IE9uIDIwMjMvNC84IDQ6NTksIEphZWdldWsgS2ltIHdyb3RlOgo+Pj4+Pj4gVGhp
cyBicmVha3MgZ2VuZXJpYy8wMDk/Cj4+Pj4+Cj4+Pj4+IEkgZ3Vlc3MgaXQgaXMgYXMgZXhwZWN0
ZWQ/Cj4+Pj4+Cj4+Pj4+IFBsZWFzZSBjaGVjayBkZXNjcmlwdGlvbiBvZiBmaWVtYXAgaW9jdGwg
bWFudWFsIGZyb20gWzFdOgo+Pj4+Pgo+Pj4+PiBGSUVNQVBfRVhURU5UX1VOS05PV04KPj4+Pj4g
VGhlIGxvY2F0aW9uIG9mIHRoaXMgZXh0ZW50IGlzIGN1cnJlbnRseSB1bmtub3duLiBUaGlzIG1h
eQo+Pj4+PiBpbmRpY2F0ZSB0aGUgZGF0YSBpcyBzdG9yZWQgb24gYW4gaW5hY2Nlc3NpYmxlIHZv
bHVtZSBvciB0aGF0Cj4+Pj4+IG5vIHN0b3JhZ2UgaGFzIGJlZW4gYWxsb2NhdGVkIGZvciB0aGUg
ZmlsZSB5ZXQuCj4+Pj4+Cj4+Pj4+IEZJRU1BUF9FWFRFTlRfREVMQUxMT0MKPj4+Pj4gVGhpcyB3
aWxsIGFsc28gc2V0IEZJRU1BUF9FWFRFTlRfVU5LTk9XTi4KPj4+Pj4KPj4+Pj4gRGVsYXllZCBh
bGxvY2F0aW9uIC0gd2hpbGUgdGhlcmUgaXMgZGF0YSBmb3IgdGhpcyBleHRlbnQsIGl0cwo+Pj4+
PiBwaHlzaWNhbCBsb2NhdGlvbiBoYXMgbm90IGJlZW4gYWxsb2NhdGVkIHlldC4KPj4+Pj4KPj4+
Pj4gRklFTUFQX0VYVEVOVF9VTldSSVRURU4KPj4+Pj4gVW53cml0dGVuIGV4dGVudCAtIHRoZSBl
eHRlbnQgaXMgYWxsb2NhdGVkIGJ1dCBpdHMgZGF0YSBoYXMgbm90Cj4+Pj4+IGJlZW4gaW5pdGlh
bGl6ZWQuIFRoaXMgaW5kaWNhdGVzIHRoZSBleHRlbnTigJlzIGRhdGEgd2lsbCBiZSBhbGwKPj4+
Pj4gemVybyBpZiByZWFkIHRocm91Z2ggdGhlIGZpbGVzeXN0ZW0gYnV0IHRoZSBjb250ZW50cyBh
cmUgdW5kZWZpbmVkCj4+Pj4+IGlmIHJlYWQgZGlyZWN0bHkgZnJvbSB0aGUgZGV2aWNlLgo+Pj4+
Pgo+Pj4+PiBbMV0gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC9sYXRlc3QvZmlsZXN5
c3RlbXMvZmllbWFwLmh0bWwKPj4+Pj4KPj4+Pj4gQWNjb3JkaW5nIHRvIGl0cyBkZXNjcmlwdGlv
biwgZjJmcyBvbmx5IHN1cHBvcnQKPj4+Pj4gRklFTUFQX0VYVEVOVF97VU5LTk9XTiwgREVMQUxM
T0N9LCBidXQgbm90IHN1cHBvcnQKPj4+Pj4gRklFTUFQX0VYVEVOVF9VTldSSVRURU4uCj4+Pj4K
Pj4+PiBObywgSSBkb24ndCB0aGluayBzby4KPj4+Cj4+PiBKYWVnZXVrLAo+Pj4KPj4+IENvdWxk
IHlvdSBwbGVhc2UgY2hlY2sgdGhlIGRldGFpbGVkIGRlc2NyaXB0aW9uIG9mIEZJRU1BUF9FWFRF
TlRfVU5XUklUVEVOPwo+Pj4gVGhlIGZsYWcgaW5kaWNhdGVzIHR3byBjb25kaXRpb25zOgo+Pj4g
MS4gb24tZGlzayBibGthZGRycyB3ZXJlIGFsbG9jYXRlZCBmb3IgZXh0ZW50LCBhbmQgdGhlIGV4
dGVudCBpcyB0YWdnZWQgYXMKPj4+IHVud3JpdHRlbiBzdGF0dXMuCj4+PiAyLiBkYXRhIHJlYWRl
ZCBvbiB0aG9zZSBibG9ja3Mgd2lsbCBiZSBhbGwgemVyby4KPj4KPj4gU29ycnksIEkgbWVhbjoK
Pj4KPj4gMS4gb24tZGlzayBibGthZGRycyB3ZXJlIGFsbG9jYXRlZCBmb3IgZXh0ZW50Owo+PiAy
LiBleHRlbnQgaXMgdGFnZ2VkIGFzIHVud3JpdHRlbiBzdGF0dXMsIGRhdGEgcmVhZGVkIG9uIHRo
b3NlIGJsb2NrcyB3aWxsIGJlCj4+IGFsbCB6ZXJvLgo+IAo+IEkgd2FzIHRoaW5raW5nIGZhbGxv
Y2F0ZS9waW4gY2FzZXMgdG8gZ2l2ZSB6ZXJvIGRhdGEuIEJ1dCwgd2UgbWF5IG5lZWQgdG8gY2hl
Y2sKPiB0aGUgc3BhY2UgZGlzY2FyZGVkIHNlY3VyZWx5IG9yIGRpc2sgc3VwcG9ydD8KCkkgdGhv
dWdodCBhYm91dCBzaW1pbGFyIHNjaGVtZSwgd2UgY2FuIGFkZCBGMkZTX0dFVF9CTE9DS19aRVJP
IGZvciBmYWxsb2NhdGUvcGluCmNhc2UgdG8gemVybyBkYXRhIGluIHZhbGlkIGJsb2NrIGFkZHJl
c3MsIGJ1dCB0aGUgcHJvYmxlbSBpcyBob3cgY2FuIHdlIGRpc3Rpbmd1aXNoCnplcm8vdmFsaWQg
ZGF0YSBmcm9tIHZhbGlkIGJsb2NrIGFkZHJlc3Mgdy9vIGFkZGl0aW9uYWwgdW53cml0dGVuIGZs
YWcgb2YgbWV0YWRhdGEuCgplLmcuCjEuIHdyaXRlIHBhZ2UgWzAsNTExXSB3LyB2YWxpZCBkYXRh
OwoyLiBmYWxsb2NhdGUvcGluIHBhZ2UgWzUxMiwxMDIzXSB3LyB6ZXJvIGRhdGE7CjMuIGZpZW1h
cCBmaWxlICAtLS0gd2hhdCBvdXRwdXQgc2hvdWxkIGl0IGJlPwoKVGhhbmtzLAoKPiAKPj4KPj4g
VGhhbmtzLAo+Pgo+Pj4KPj4+IFNvLCBsZXQncyBjaGVjayBmMmZzJyBzdGF0dXM6Cj4+PiAtIGZh
bGxvY2F0ZSBvbmx5IHJlc2VydmUgdmFsaWQgYmxvY2sgY291bnQgYW5kIHNldCBORVdfQUREUiBp
biBkbm9kZSwgc28KPj4+IGl0IGRvZXMgbm90IG1hdGNoIGNvbmRpdGlvbiAxKQo+Pj4gLSBwaW4g
JiBmYWxsb2NhdGUgcHJlYWxsb2NhdGVzIGJsa2FkZHJzIGFuZCBzZXQgYmxrYWRkcnMgaW4gZG5v
ZGUsIGJ1dAo+Pj4gY29udGVudCBvbiB0aG9zZSBibGthZGRycyBtYXkgY29udGFpbiB6ZXJvIG9y
IHJhbmRvbSBkYXRhLCBzbyBpdCBkb2VzIG5vdAo+Pj4gbWF0Y2jCoCBjb25kaXRpb24gMikKPj4+
Cj4+PiBDaHJpc3RvcGggZGVzY3JpYmVzIHRoaXMgaXNzdWUgaW4gYmVsb3cgcGF0Y2ggYXMgd2Vs
bCwgeW91IGNhbiBjaGVjayBpdC4KPj4+IGRhOGM3ZmVjYzljNyAoImYyZnM6IHJlbmFtZSBGMkZT
X01BUF9VTldSSVRURU4gdG8gRjJGU19NQVBfREVMQUxMT0MiKQo+Pj4KPj4+IEFtIEkgbWlzc2lu
ZyBzb21ldGhpbmc/Cj4+Pgo+Pj4gVGhhbmtzLAo+Pj4KPj4+Pgo+Pj4+Pgo+Pj4+PiBTbyAwMDks
IDA5MiwgMDk0IC4uIHdoaWNoIGV4cGVjdHMgdW53cml0dGVuIHN0YXR1cyBmcm9tIGV4dGVudCB3
aWxsCj4+Pj4+IGZhaWwuCj4+Pj4+Cj4+Pj4+IEhvdyBhYm91dCBkaXNhYmxpbmcgdGhvc2UgdGVz
dGNhc2U/Cj4+Pj4+Cj4+Pj4+IFRoYW5rcywKPj4+Pj4KPj4+Pj4+Cj4+Pj4+PiBPbiAwNC8wNSwg
Q2hhbyBZdSB3cm90ZToKPj4+Pj4+PiB4ZnN0ZXN0IGdlbmVyaWMvNjE0IGZhaWxzIHRvIHJ1biBk
dWUgYmVsb3cgcmVhc29uOgo+Pj4+Pj4+Cj4+Pj4+Pj4gZ2VuZXJpYy82MTQgMXMgLi4uIFtub3Qg
cnVuXSB0ZXN0IHJlcXVpcmVzIGRlbGF5ZWQgYWxsb2NhdGlvbiBidWZmZXJlZCB3cml0ZXMKPj4+
Pj4+Pgo+Pj4+Pj4+IFRoZSByb290IGNhdXNlIGlzIGYyZnMgdGFncyB3cm9uZyBmaWVtYXAgZmxh
ZyBmb3IgZGVsYXkgYWxsb2NhdGVkCj4+Pj4+Pj4gZXh0ZW50Lgo+Pj4+Pj4+Cj4+Pj4+Pj4gUXVv
dGVkIGZyb20gZmllbWFwLmg6Cj4+Pj4+Pj4gRklFTUFQX0VYVEVOVF9VTktOT1dOwqDCoMKgwqDC
oMKgwqAgMHgwMDAwMDAwMiAvKiBEYXRhIGxvY2F0aW9uIHVua25vd24uICovCj4+Pj4+Pj4gRklF
TUFQX0VYVEVOVF9ERUxBTExPQ8KgwqDCoMKgwqDCoMKgIDB4MDAwMDAwMDQgLyogTG9jYXRpb24g
c3RpbGwgcGVuZGluZy4KPj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICogU2V0cyBFWFRFTlRfVU5LTk9XTi4gKi8KPj4+Pj4+PiBG
SUVNQVBfRVhURU5UX1VOV1JJVFRFTsKgwqDCoMKgwqDCoMKgIDB4MDAwMDA4MDAgLyogU3BhY2Ug
YWxsb2NhdGVkLCBidXQKPj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICogbm8gZGF0YSAoaS5lLiB6ZXJvKS4gKi8KPj4+Pj4+Pgo+
Pj4+Pj4+IEZJRU1BUF9FWFRFTlRfVU5XUklUVEVOIG1lYW5zIGJsb2NrIGFkZHJlc3MgaXMgcHJl
YWxsb2NhdGVkLCBidXQgdy9vCj4+Pj4+Pj4gYmVlbiB3cml0dGVuIGFueSBkYXRhLCB3aGljaCBz
dGF0dXMgZjJmcyBpcyBub3Qgc3VwcG9ydGVkIG5vdywgZm9yIGFsbAo+Pj4+Pj4+IE5FV19BRERS
IGJsb2NrIGFkZHJlc3NlcywgaXQgbWVhbnMgZGVsYXkgYWxsb2NhdGVkIGJsb2Nrcywgc28gbGV0
J3MKPj4+Pj4+PiB0YWcgRklFTUFQX0VYVEVOVF9ERUxBTExPQyBpbnN0ZWFkLgo+Pj4+Pj4+Cj4+
Pj4+Pj4gVGVzdGNhc2U6Cj4+Pj4+Pj4geGZzX2lvIC1mIC1jICdwd3JpdGUgMCA2NGsnIC9tbnQv
ZjJmcy9maWxlOwo+Pj4+Pj4+IGZpbGVmcmFnIC12IC9tbnQvZjJmcy9maWxlCj4+Pj4+Pj4KPj4+
Pj4+PiBPdXRwdXQ6Cj4+Pj4+Pj4gLSBCZWZvcmUKPj4+Pj4+PiBGaWxlc3lzdGVtIHR5cGUgaXM6
IGYyZjUyMDEwCj4+Pj4+Pj4gRml6ZSBvZiAvbW50L2YyZnMvZmlsZSBpcyA2NTUzNiAoMTYgYmxv
Y2tzIG9mIDQwOTYgYnl0ZXMpCj4+Pj4+Pj4gIMKgwqAgZXh0OsKgwqDCoMKgIGxvZ2ljYWxfb2Zm
c2V0OsKgwqDCoMKgwqDCoMKgIHBoeXNpY2FsX29mZnNldDogbGVuZ3RoOsKgwqAgZXhwZWN0ZWQ6
IGZsYWdzOgo+Pj4+Pj4+ICDCoMKgwqDCoCAwOsKgwqDCoMKgwqDCoMKgIDAuLsKgwqDCoMKgwqAg
MTU6wqDCoMKgwqDCoMKgwqDCoMKgIDAuLsKgwqDCoMKgwqDCoMKgIDE1OsKgwqDCoMKgIDE2OsKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsYXN0LHVud3JpdHRlbixtZXJnZWQsZW9mCj4+Pj4+Pj4g
L21udC9mMmZzL2ZpbGU6IDEgZXh0ZW50IGZvdW5kCj4+Pj4+Pj4KPj4+Pj4+PiBBZnRlcjoKPj4+
Pj4+PiBGaWxlc3lzdGVtIHR5cGUgaXM6IGYyZjUyMDEwCj4+Pj4+Pj4gRmlsZSBzaXplIG9mIC9t
bnQvZjJmcy9maWxlIGlzIDY1NTM2ICgxNiBibG9ja3Mgb2YgNDA5NiBieXRlcykKPj4+Pj4+PiAg
wqDCoCBleHQ6wqDCoMKgwqAgbG9naWNhbF9vZmZzZXQ6wqDCoMKgwqDCoMKgwqAgcGh5c2ljYWxf
b2Zmc2V0OiBsZW5ndGg6wqDCoCBleHBlY3RlZDogZmxhZ3M6Cj4+Pj4+Pj4gIMKgwqDCoMKgIDA6
wqDCoMKgwqDCoMKgwqAgMC4uwqDCoMKgwqDCoCAxNTrCoMKgwqDCoMKgwqDCoMKgwqAgMC4uwqDC
oMKgwqDCoMKgwqDCoCAwOsKgwqDCoMKgwqAgMDrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGFz
dCx1bmtub3duX2xvYyxkZWxhbGxvYyxlb2YKPj4+Pj4+PiAvbW50L2YyZnMvZmlsZTogMSBleHRl
bnQgZm91bmQKPj4+Pj4+Pgo+Pj4+Pj4+IEZpeGVzOiA3ZjYzZWI3N2FmN2IgKCJmMmZzOiByZXBv
cnQgdW53cml0dGVuIGFyZWEgaW4gZjJmc19maWVtYXAiKQo+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6
IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPj4+Pj4+PiAtLS0KPj4+Pj4+PiAgwqDCoCBmcy9m
MmZzL2RhdGEuYyB8IDcgKysrKystLQo+Pj4+Pj4+ICDCoMKgIDEgZmlsZSBjaGFuZ2VkLCA1IGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Pj4+Pj4KPj4+Pj4+PiBkaWZmIC0tZ2l0IGEv
ZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEuYwo+Pj4+Pj4+IGluZGV4IDM1OWRlNjUwNzcy
ZS4uM2FmYzk3NjQ3NDNlIDEwMDY0NAo+Pj4+Pj4+IC0tLSBhL2ZzL2YyZnMvZGF0YS5jCj4+Pj4+
Pj4gKysrIGIvZnMvZjJmcy9kYXRhLmMKPj4+Pj4+PiBAQCAtMTk5NSw3ICsxOTk1LDEwIEBAIGlu
dCBmMmZzX2ZpZW1hcChzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZmllbWFwX2V4dGVudF9p
bmZvICpmaWVpbmZvLAo+Pj4+Pj4+ICDCoMKgwqDCoMKgwqAgfQo+Pj4+Pj4+ICDCoMKgwqDCoMKg
wqAgaWYgKHNpemUpIHsKPj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgZmxhZ3MgfD0gRklFTUFQX0VY
VEVOVF9NRVJHRUQ7Cj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChmbGFncyAmIEZJRU1BUF9F
WFRFTlRfREVMQUxMT0MpCj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGh5cyA9IDA7
Cj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGVsc2UKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBmbGFncyB8PSBGSUVNQVBfRVhURU5UX01FUkdFRDsKPj4+Pj4+PiAgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgaWYgKElTX0VOQ1JZUFRFRChpbm9kZSkpCj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgZmxhZ3MgfD0gRklFTUFQX0VYVEVOVF9EQVRBX0VOQ1JZUFRFRDsKPj4+
Pj4+PiBAQCAtMjAzNSw3ICsyMDM4LDcgQEAgaW50IGYyZnNfZmllbWFwKHN0cnVjdCBpbm9kZSAq
aW5vZGUsIHN0cnVjdCBmaWVtYXBfZXh0ZW50X2luZm8gKmZpZWluZm8sCj4+Pj4+Pj4gIMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzaXplICs9IGJsa3NfdG9fYnl0ZXMoaW5v
ZGUsIDEpOwo+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4+Pj4+PiAg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfSBlbHNlIGlmIChtYXAubV9mbGFncyAmIEYyRlNfTUFQX0RF
TEFMTE9DKSB7Cj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZmxhZ3MgPSBGSUVNQVBf
RVhURU5UX1VOV1JJVFRFTjsKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmbGFncyA9
IEZJRU1BUF9FWFRFTlRfREVMQUxMT0M7Cj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0K
Pj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RhcnRfYmxrICs9IGJ5dGVzX3RvX2Jsa3Mo
aW5vZGUsIHNpemUpOwo+Pj4+Pj4+IC0tIAo+Pj4+Pj4+IDIuMzYuMQo+Pj4KPj4+Cj4+PiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+Pj4gTGludXgtZjJm
cy1kZXZlbCBtYWlsaW5nIGxpc3QKPj4+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9y
Z2UubmV0Cj4+PiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9s
aW51eC1mMmZzLWRldmVsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMv
bGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
