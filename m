Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B4C86D94A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  1 Mar 2024 02:59:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rfsB5-0003XO-8L;
	Fri, 01 Mar 2024 01:59:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rfsB0-0003XG-Hp
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 Mar 2024 01:59:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WRoPTtZMNc3c0Sp7xPF7Eb/hQpAgphreepl1exGJJ24=; b=H0F28JASMPOMOlpg+RWp83J8/p
 Ob/hhKqgHlpmm/Uzw9zBxIKrhHT+yKCjeLNZAAPS/9ts2+QXFR9W/HiMDu9vZVmlyDDd5SwhdBow8
 6lYIWBJPGHElvlV95Q8d0wd4RKTSeXiqEnjMRe0q/mtTSKY4jlQnU6ZVrKigIVY48SXk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WRoPTtZMNc3c0Sp7xPF7Eb/hQpAgphreepl1exGJJ24=; b=bR7GXVQIXw+Usx2yL+URpbMf36
 YSi/qaeSnKoWL5wUEq3/JlKx8FEGqB+MS/CDk3W1ndPZ0KCwDErYDmuP2d4aBeiw8+AHjvcNcGTBE
 lwLHJBBu/kHMVVm7jxLAGdEglKuGQmZb0OP2bYrXRFGLsRz0SUI9hccMuW5IWsJ+PMg8=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rfsAv-0004XP-T9 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 Mar 2024 01:59:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id EF804CE249A;
 Fri,  1 Mar 2024 01:58:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08B5EC433F1;
 Fri,  1 Mar 2024 01:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709258329;
 bh=OcuenNbFeoaYEW2LlBjOx0+q6bI5pkE/MIMURp6AGlA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tyL1pMipG955O6PPN5Kni6DnbhUe/1VDEcnhsjoLLm3TkFiWB1XkDRBA/13CDX9IS
 5d4KUrMoCq5ocfanOzjVbSjKRR12DOylJV8o9+4lX2KG1pUlQhRn2I3Mtevdpfr5w3
 r+C79pi+2BRxVRNJXsro8EeZmI6dX/rloNCJjURPEdaHHQ+Zr7LTzWFv1jkz4nKaSI
 VQvlzEZ66YXcws3vj4gyqg1MTfFJjKeiUWdvb3jCBGBKmfbUYDBOzWccGGU0dnfzKR
 jU1FpyjEDLTpVMZLYC0xXhAKNLf80zb2P4ptm1JqTvSp6HCoWNc2FMWx+4KDxGWhnN
 VHZaZq+KF0PDQ==
Date: Thu, 29 Feb 2024 17:58:47 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZeE2VwBmGJxrgKZ2@google.com>
References: <20240226013208.2389246-1-chao@kernel.org>
 <2b81aa6f-db51-4a7c-97ab-2af2c2fea056@kernel.org>
 <CACOAw_yn4m+nEGMEX8RL1xFEaZpzXvjUhUdSoo9d2EeGfzPrAA@mail.gmail.com>
 <3325fdb0-1f21-4ba9-919a-09fa0206f7c5@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3325fdb0-1f21-4ba9-919a-09fa0206f7c5@kernel.org>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 03/01, Chao Yu wrote: > On 2024/3/1 1:41, Daeho Jeong wrote:
    > > On Thu, Feb 29, 2024 at 2:11 AM Chao Yu <chao@kernel.org> wrote: >
   > > > > > Jaegeuk, Daeho, > > > > > > Any comments on this seri [...] 
 
 Content analysis details:   (-2.6 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [145.40.73.55 listed in list.dnswl.org]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rfsAv-0004XP-T9
Subject: Re: [f2fs-dev] [PATCH 1/4] f2fs: fix blkofs_end correctly in
 f2fs_migrate_blocks()
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
Cc: linux-f2fs-devel@lists.sourceforge.net, Daeho Jeong <daehojeong@google.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMDMvMDEsIENoYW8gWXUgd3JvdGU6Cj4gT24gMjAyNC8zLzEgMTo0MSwgRGFlaG8gSmVvbmcg
d3JvdGU6Cj4gPiBPbiBUaHUsIEZlYiAyOSwgMjAyNCBhdCAyOjEx4oCvQU0gQ2hhbyBZdSA8Y2hh
b0BrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4gCj4gPiA+IEphZWdldWssIERhZWhvLAo+ID4gPiAK
PiA+ID4gQW55IGNvbW1lbnRzIG9uIHRoaXMgc2VyaWFscz8KPiA+ID4gCj4gPiA+IFRoYW5rcywK
PiA+IAo+ID4gTm8gZnVuY3Rpb25hbCBkaWZmZXJlbmNlIGhlcmUsIHNpbmNlIHN0YXJ0X2JsayBp
cyBhbHdheXMgYWxpZ25lZCB3aXRoCj4gPiB0aGUgc2VjdGlvbiBhZGRyZXNzLgo+IAo+IFlvdSdy
ZSByaWdodC4KPiAKPiA+IEhvd2V2ZXIsIHRoaXMgaXMgbW9yZSBjbGVhciBpbiBpdHNlbGYuCj4g
Cj4gVGhhbmtzIGZvciB0aGUgcmV2aWV3IQo+IAo+IE9uZSBtb3JlIHRoaW5nIGlzLCBJIGZvdW5k
IHRoYXQgZmFsbG9jYXRlKCkgb24gcGlubmVkIGZpbGUgd2lsbCBwcmVhbGxvY2F0ZQo+IGFsaWdu
ZWQgdy8gc2VjdGlvbi1zaXplIHdoaWNoIGlzIGFib3V0IHNldmVyYWwgaHVuZHJlZCBtZWdhYnl0
ZSBmb3IgWlVGUyBjYXNlLAo+IHNpbmNlIGNvbW1pdCBlMTE3NWYwMjI5MTEgKCJmMmZzOiBmaXgg
dG8gYWxpZ24gdG8gc2VjdGlvbiBmb3IgZmFsbG9jYXRlKCkgb24KPiBwaW5uZWQgZmlsZSIpLgo+
IAo+IEl0IGxvb2tzIG5vdCBtYWtlIHNlbnNlLCBlc3BlY2lhbGx5IGZvciBsb2djYXQgY2FzZSB3
aGljaCBhY3R1YWxseSB3YW50IHRvCj4gcHJlYWxsb2NhdGUgMk1CIHNwYWNlLCBzbywgd2hhdCBh
Ym91dCByZXZlcnRpbmcgY29tbWl0IGUxMTc1ZjAyMjkxMSBhbmQKPiBsb29raW5nIGZvciBvdGhl
ciBzb2x1dGlvbiB0byBhdm9pZCBHQ2luZyBvbiBmcmFnbWVudGVkIHBpbm5lZCBmaWxlLgoKSSBy
ZW1lbWJlciB3ZSByZW1vdmVkIHRoZSBsb2djYXQgY2FzZS4KCj4gCj4gV2hhdCBkbyB5b3UgdGhp
bms/Cj4gCj4gVGhhbmtzLAo+IAo+ID4gCj4gPiBSZXZpZXdlZC1ieTogRGFlaG8gSmVvbmcgPGRh
ZWhvamVvbmdAZ29vZ2xlLmNvbT4KPiA+IAo+ID4gVGhhbmtzLAo+ID4gCj4gPiA+IAo+ID4gPiBP
biAyMDI0LzIvMjYgOTozMiwgQ2hhbyBZdSB3cm90ZToKPiA+ID4gPiBJbiBmMmZzX21pZ3JhdGVf
YmxvY2tzKCksIHdoZW4gdHJhdmVyc2luZyBibG9ja3MgaW4gbGFzdCBzZWN0aW9uLAo+ID4gPiA+
IGJsa29mc19lbmQgc2hvdWxkIGJlIChzdGFydF9ibGsgKyBibGtjbnQgLSAxKSAlIGJsa19wZXJf
c2VjLCBmaXggaXQuCj4gPiA+ID4gCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQ2hhbyBZdSA8Y2hh
b0BrZXJuZWwub3JnPgo+ID4gPiA+IC0tLQo+ID4gPiA+ICAgIGZzL2YyZnMvZGF0YS5jIHwgNSAr
KystLQo+ID4gPiA+ICAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCj4gPiA+ID4gCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMv
ZjJmcy9kYXRhLmMKPiA+ID4gPiBpbmRleCBjMjFiOTJmMTg0NjMuLjBjNzI4ZTgyZDkzNiAxMDA2
NDQKPiA+ID4gPiAtLS0gYS9mcy9mMmZzL2RhdGEuYwo+ID4gPiA+ICsrKyBiL2ZzL2YyZnMvZGF0
YS5jCj4gPiA+ID4gQEAgLTM4NDEsMTMgKzM4NDEsMTQgQEAgc3RhdGljIGludCBmMmZzX21pZ3Jh
dGVfYmxvY2tzKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGJsb2NrX3Qgc3RhcnRfYmxrLAo+ID4gPiA+
ICAgICAgICBzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkgPSBGMkZTX0lfU0IoaW5vZGUpOwo+ID4g
PiA+ICAgICAgICB1bnNpZ25lZCBpbnQgYmxrb2ZzOwo+ID4gPiA+ICAgICAgICB1bnNpZ25lZCBp
bnQgYmxrX3Blcl9zZWMgPSBCTEtTX1BFUl9TRUMoc2JpKTsKPiA+ID4gPiArICAgICB1bnNpZ25l
ZCBpbnQgZW5kX2JsayA9IHN0YXJ0X2JsayArIGJsa2NudCAtIDE7Cj4gPiA+ID4gICAgICAgIHVu
c2lnbmVkIGludCBzZWNpZHggPSBzdGFydF9ibGsgLyBibGtfcGVyX3NlYzsKPiA+ID4gPiAgICAg
ICAgdW5zaWduZWQgaW50IGVuZF9zZWM7Cj4gPiA+ID4gICAgICAgIGludCByZXQgPSAwOwo+ID4g
PiA+IAo+ID4gPiA+ICAgICAgICBpZiAoIWJsa2NudCkKPiA+ID4gPiAgICAgICAgICAgICAgICBy
ZXR1cm4gMDsKPiA+ID4gPiAtICAgICBlbmRfc2VjID0gc2VjaWR4ICsgKGJsa2NudCAtIDEpIC8g
YmxrX3Blcl9zZWM7Cj4gPiA+ID4gKyAgICAgZW5kX3NlYyA9IGVuZF9ibGsgLyBibGtfcGVyX3Nl
YzsKPiA+ID4gPiAKPiA+ID4gPiAgICAgICAgZjJmc19kb3duX3dyaXRlKCZGMkZTX0koaW5vZGUp
LT5pX2djX3J3c2VtW1dSSVRFXSk7Cj4gPiA+ID4gICAgICAgIGZpbGVtYXBfaW52YWxpZGF0ZV9s
b2NrKGlub2RlLT5pX21hcHBpbmcpOwo+ID4gPiA+IEBAIC0zODU3LDcgKzM4NTgsNyBAQCBzdGF0
aWMgaW50IGYyZnNfbWlncmF0ZV9ibG9ja3Moc3RydWN0IGlub2RlICppbm9kZSwgYmxvY2tfdCBz
dGFydF9ibGssCj4gPiA+ID4gCj4gPiA+ID4gICAgICAgIGZvciAoOyBzZWNpZHggPD0gZW5kX3Nl
Yzsgc2VjaWR4KyspIHsKPiA+ID4gPiAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgYmxrb2Zz
X2VuZCA9IHNlY2lkeCA9PSBlbmRfc2VjID8KPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAg
KGJsa2NudCAtIDEpICUgYmxrX3Blcl9zZWMgOiBibGtfcGVyX3NlYyAtIDE7Cj4gPiA+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgZW5kX2JsayAlIGJsa19wZXJfc2VjIDogYmxrX3Bl
cl9zZWMgLSAxOwo+ID4gPiA+IAo+ID4gPiA+ICAgICAgICAgICAgICAgIGYyZnNfZG93bl93cml0
ZSgmc2JpLT5waW5fc2VtKTsKPiA+ID4gPiAKPiA+ID4gCj4gPiA+IAo+ID4gPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gPiBMaW51eC1mMmZzLWRl
dmVsIG1haWxpbmcgbGlzdAo+ID4gPiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldAo+ID4gPiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9s
aW51eC1mMmZzLWRldmVsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMv
bGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
