Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF963F1297
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Aug 2021 06:50:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mGa04-00083Z-9t; Thu, 19 Aug 2021 04:49:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mGa01-00083S-ML
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 Aug 2021 04:49:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B0EJkXAubeYVR9YmsQUbWLH4qNhXcVxKlR/KnsrY/Cc=; b=UrVxnNcDntrJe0lP5t1VeKVaUu
 iZkRgInL/2wtsu/QE/4J1BDwaNVALs63P44B3ceehrKKQD+YMCT+CVULgZ2Od7U/D9PySnUsyiG9w
 s+8DrnCSgAbtAur7eHbBaaEyruPj2IECoP60O4my7P6Bi2ZckBoPWrgih6u8vyU1R8vw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=B0EJkXAubeYVR9YmsQUbWLH4qNhXcVxKlR/KnsrY/Cc=; b=HmtuJ/g7iJyuRjrUO6yuRmEjdn
 GUW9bWNpmR7IAvMjQIr68kow/LOJho7l59StVIMjLCQd2kZLrdlw2NYKHSwpUX7BTSMtWpjCFgFZP
 bA1j0rP0ruq6XQ/aK87BrG6bKv5BqnVAcZYH6cJ+HI7US1bMvonH2JRmA3HKhkHvhniM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mGZzw-00BAeF-CA
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 Aug 2021 04:49:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BB79D610CF;
 Thu, 19 Aug 2021 04:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629348579;
 bh=0Cg8oLWlkJnSS9ZcFq1U+zblisO3esXh0aghBm3X7GE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Dh/vU215RfcMd2KkH4rG/2rLm/jIZ7EZdfuyqnP4eq9xMTDxqXvzQCSVwTC9tQFiw
 u9LY5T0uGj2QeM1I0o82X2wNBlW9MNYA+ROLYNuB1DzCuLa1YVQBRw9yDoao78pcde
 4YcVS1K7lji6lv88DrwLflWLjjvTeF8FPFTMYxAa31ZMy3l0e4x9uP5BLFCfs8YRG6
 PnFxwYmm6a6DCBsdf/nk5Wr29DIVIPRsUba8Rl2uUTeUkLrIYg62ztounl8c5gtmYq
 wQARy19WaM7342+SVX5Pw+HkT2MKJfm8WGQyFJC69NJeFRPvehl3i3mGJXQaqfLnaR
 Lskps/U2dqEnA==
To: =?UTF-8?B?5p2O5oms6Z+s?= <frank.li@vivo.com>
References: <AGwAWQBVD3NfsYDCdBIWb4qP.3.1629094420548.Hmail.frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <ee60f940-c1a6-e41d-a163-bf277290c231@kernel.org>
Date: Thu, 19 Aug 2021 12:49:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <AGwAWQBVD3NfsYDCdBIWb4qP.3.1629094420548.Hmail.frank.li@vivo.com>
Content-Language: en-US
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2021/8/16 14:13, 李扬韬 wrote: >>>>> I've added new
   sysfs nodes to show discard stat since mount, which >>>>> will help us analyze
    whether the performance problem is related to >>>>> discard. >> [...] 
 
 Content analysis details:   (-7.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [198.145.29.99 listed in list.dnswl.org]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
  0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
                             blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [URIs: lkml.org]
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mGZzw-00BAeF-CA
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: add sysfs nodes to get discard
 information
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMS84LzE2IDE0OjEzLCDmnY7miazpn6wgd3JvdGU6Cj4+Pj4+IEkndmUgYWRkZWQgbmV3
IHN5c2ZzIG5vZGVzIHRvIHNob3cgZGlzY2FyZCBzdGF0IHNpbmNlIG1vdW50LCB3aGljaAo+Pj4+
PiB3aWxsIGhlbHAgdXMgYW5hbHl6ZSB3aGV0aGVyIHRoZSBwZXJmb3JtYW5jZSBwcm9ibGVtIGlz
IHJlbGF0ZWQgdG8KPj4+Pj4gZGlzY2FyZC4KPj4+Pj4KPj4+Pj4gaXNzdWVkX2Rpc2NhcmQgIC0g
U2hvd3MgdGhlIG51bWJlciBvZiBpc3N1ZWQgZGlzY2FyZAo+Pj4+PiBxdWV1ZWRfZGlzY2FyZCAg
LSBTaG93cyB0aGUgbnVtYmVyIG9mIGNhY2hlZCBkaXNjYXJkIGNtZCBjb3VudAo+Pj4+PiBkaXNj
YXJkX2NtZF9jbnQgLSBTaG93cyB0aGUgbnVtYmVyIG9mIGNhY2hlZCBkaXNjYXJkIGNtZCBjb3Vu
dAo+Pj4+PiB1bmRpc2NhcmRfYmxrcyAgLSBTaG93cyB0aGUgbnVtYmVyIG9mIHVuZGlzY2FyZCBi
bG9ja3MKPj4+Pgo+Pj4+IFdlIGhhdmUgZXhwb3J0ZWQgdGhlbSBpbiBkZWJ1Z2ZzLCBjYW4geW91
IHVzZSB0aGF0Pwo+Pj4+Cj4+Pj4gVGhhbmtzLAo+Pj4KPj4+IEJ1dCBub3cgQW5kcm9pZCBpcyBm
b3JiaWRkZW4gdG8gb3BlbiBkZWJ1Z2ZzLCBhbmQgaW4gZmFjdCB3ZSBoYXZlIG5vdAo+Pj4gb3Bl
bmVkIHRoaXMgY29uZmlndXJhdGlvbiBmb3IgYSBsb25nIHRpbWUuCj4+Cj4+IFdlcmVuJ3QgdGhl
bSBiZSB1c2VkIGZvciBkZWJ1ZyBwdXJwb3NlPyBjYW4geW91IHBsZWFzZSBleHBsYWluIG1vcmUg
YWJvdXQKPj4geW91ciB1c2UgY2FzZT8KPiAKPiBEdXJpbmcgbG9uZy10ZXJtIGFnaW5nIHRlc3Qg
b3Igbm9ybWFsIHVzZSwgc29tZXRpbWVzIHRoZXJlIHdpbGwgYmUgcGVyZm9ybWFuY2UKPiBkZWdy
YWRhdGlvbiBwcm9ibGVtcy4gSXQgbWF5IGJlIGNhdXNlZCBieSBzdG9yYWdlLCBvciBpdCBtYXkg
YmUgY2F1c2VkIGJ5IHRoZQo+IGZpbGVzeXN0ZW0uIEZvciBleGFtcGxlLCB0aGUgZmlsZXN5c3Rl
bSBhY2N1bXVsYXRlcyBhIGxhcmdlIG51bWJlciBvZiB1bmRpc2NhcmQKPiAgIGJsb2Nrcy4gQWx0
aG91Z2ggdGhlcmUgaXMgc29tZSByZW1haW5pbmcgc3BhY2UsIHRoZSBhbmRyb2lkYmVuY2ggdGVz
dCB3aWxsCj4gc2hvdyBwZXJmb3JtYW5jZSBkZWdyYWRhdGlvbi4gVGhlcmVmb3JlLCBpdCBpcyBu
ZWNlc3NhcnkgdG8gZXhwb3J0IGluZm9ybWF0aW9uCj4gcmVsYXRlZCB0byBkaXNjYXJkIHNvIHRo
YXQgd2UgY2FuIGNvbmZpcm0gdGhpcyBzaXR1YXRpb24uCgpJIGhhdmUgYSBzb2x1dGlvbiBmb3Ig
eW91ciBjYXNlLCBob3dldmVyIGZpbmFsbHksIHdlIGhhdmVuJ3QgdXNlZCBzdWNoIGRpc2NhcmQK
cG9saWN5IGJ5IGRlZmF1bHQgZHVlIHRvIHRoZSBwb2xpY3kgbmVlZHMgdG8gYmUgZGVzaWduZWQg
bW9yZSB0dW5hYmxlIGZvcgpkZXZpY2VzIHdpdGggZGlmZmVyZW50IGNoYXJhY3RlcnMuCgpTZWUg
bW9yZSBkZXRhaWxzIGluIGJlbG93IHBhdGNoZXM6CgpodHRwczovL2xrbWwub3JnL2xrbWwvMjAx
OC84LzEwLzIxOQpodHRwczovL2xrbWwub3JnL2xrbWwvMjAxOC84LzEwLzIyMAoKVGhhbmtzLAoK
PiAKPiBUaHgsCj4gCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMv
bGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
