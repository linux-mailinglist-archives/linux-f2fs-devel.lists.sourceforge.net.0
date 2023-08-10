Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9419B777674
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Aug 2023 13:06:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qU3UU-0005t3-Pz;
	Thu, 10 Aug 2023 11:06:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1qU3US-0005sx-7g
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Aug 2023 11:06:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1DFh8evqtxspjStydxXxKkjnilpW0tYumnluwrTMIZo=; b=Jq/rBe7AGxsG257n0ku1FO+ky5
 p7o4EaC74jtzOuvl49RviZXxYuQtJNnjQpTNEjx10zBYy/HsDAJLwUTujBLTpj1WNx6PZwDcBdzM7
 7Uw3ykdZSNsX0OIibXyI7rk4qHayRja0hnmdrZqMVtUu1mE7CsqIgEf0ygLP4X7vmnWc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1DFh8evqtxspjStydxXxKkjnilpW0tYumnluwrTMIZo=; b=gTTc/alklwYhxjqM1F7tEnNTBX
 ApLQL4NZlt5fBfMcPiX0+EPUikYjnEFM+ti8P75kpEh8BrdgxmGDrcj9P5v+Vsx5t1+1kHSqryPSC
 TyYSgNB3/ZwCL5HRbPIZPvG0RCv//hyjSZJFgp4UHKkLyqhk/WbxUpo9q0Xnr3zxWVUI=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qU3UL-0008JY-66 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Aug 2023 11:06:04 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5FD561F749;
 Thu, 10 Aug 2023 11:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1691665548; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1DFh8evqtxspjStydxXxKkjnilpW0tYumnluwrTMIZo=;
 b=vLT7nxhsKaVB+2d6j1Yf5X8t1GLYqRuuN4g6ZutMMICOunL7y0FZNv7gLZiYXzC/l2Xomu
 I8xmm0CPUZCp/iFMbz+eWr+/L/YJb1/utRAjSeiWYdJX1v/2EQl6s2syK6Yg4TzJfLlWXK
 j+SruuD6SzbR8Z3B6IZKMOfh62510CU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1691665548;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1DFh8evqtxspjStydxXxKkjnilpW0tYumnluwrTMIZo=;
 b=gjop8gtt3TnFXcbkSm06MHlxNzKkmd+CJQt27qbqqSRylA/dQexstbBZ/MQ0KnNaiV041a
 Mrb6ToOuPtQHkpAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4EB2E138E2;
 Thu, 10 Aug 2023 11:05:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id bLIxE4zE1GQpLAAAMHmgww
 (envelope-from <jack@suse.cz>); Thu, 10 Aug 2023 11:05:48 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id D2565A076F; Thu, 10 Aug 2023 13:05:47 +0200 (CEST)
Date: Thu, 10 Aug 2023 13:05:47 +0200
From: Jan Kara <jack@suse.cz>
To: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Message-ID: <20230810110547.ks62g2flysgwpgru@quack3>
References: <20230802154131.2221419-1-hch@lst.de>
 <20230802154131.2221419-3-hch@lst.de>
 <20230803114651.ihtqqgthbdjjgxev@quack3>
 <CAKFNMomzHg33SHnp6xGMEZY=+k6Y4t7dvBvgBDbO9H3ujzNDCw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKFNMomzHg33SHnp6xGMEZY=+k6Y4t7dvBvgBDbO9H3ujzNDCw@mail.gmail.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Fri 04-08-23 11:01:39, Ryusuke Konishi wrote: > On Thu,
    Aug 3, 2023 at 8:46 PM Jan Kara wrote: > > > > On Wed 02-08-23 17:41:21,
    Christoph Hellwig wrote: > > > Use the generic setup_bdev_super he [...] 
 
 Content analysis details:   (-2.5 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [195.135.220.29 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
X-Headers-End: 1qU3UL-0008JY-66
Subject: Re: [f2fs-dev] [PATCH 02/12] nilfs2: use setup_bdev_super to
 de-duplicate the mount code
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 Christian Brauner <brauner@kernel.org>, linux-nilfs@vger.kernel.org,
 Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org,
 "Darrick J. Wong" <djwong@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Al Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 David Sterba <dsterba@suse.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gRnJpIDA0LTA4LTIzIDExOjAxOjM5LCBSeXVzdWtlIEtvbmlzaGkgd3JvdGU6Cj4gT24gVGh1
LCBBdWcgMywgMjAyMyBhdCA4OjQ24oCvUE0gSmFuIEthcmEgd3JvdGU6Cj4gPgo+ID4gT24gV2Vk
IDAyLTA4LTIzIDE3OjQxOjIxLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiA+ID4gVXNlIHRo
ZSBnZW5lcmljIHNldHVwX2JkZXZfc3VwZXIgaGVscGVyIHRvIG9wZW4gdGhlIG1haW4gYmxvY2sg
ZGV2aWNlCj4gPiA+IGFuZCBkbyB2YXJpb3VzIGJpdHMgb2Ygc3VwZXJibG9jayBzZXR1cCBpbnN0
ZWFkIG9mIGR1cGxpY2F0aW5nIHRoZQo+ID4gPiBsb2dpYy4gIFRoaXMgaW5jbHVkZXMgbW92aW5n
IHRvIHRoZSBuZXcgc2NoZW1lIGltcGxlbWVudGVkIGluIGNvbW1vbgo+ID4gPiBjb2RlIHRoYXQg
b25seSBvcGVucyB0aGUgYmxvY2sgZGV2aWNlIGFmdGVyIHRoZSBzdXBlcmJsb2NrIGhhcyBhbGxv
Y2F0ZWQuCj4gPiA+Cj4gPiA+IEl0IGRvZXMgbm90IHlldCBjb252ZXJ0IG5pbGZzMiB0byB0aGUg
bmV3IG1vdW50IEFQSSwgYnV0IGRvaW5nIHNvIHdpbGwKPiA+ID4gYmVjb21lIGEgYml0IHNpbXBs
ZXIgYWZ0ZXIgdGhpcyBmaXJzdCBzdGVwLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBDaHJp
c3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KPiA+Cj4gPiBBRkFJQ1MgbmlsZnMyIGNvdWxkICph
bG1vc3QqIHVzZSBtb3VudF9iZGV2KCkgZGlyZWN0bHkgYW5kIHRoZW4ganVzdCBkbyBpdHMKPiAK
PiA+IHNuYXBzaG90IHRoaW5nIGFmdGVyIG1vdW50X2JkZXYoKSByZXR1cm5zLiBCdXQgaXQgaGFz
IHRoaXMgd2VpcmQgbG9naWMKPiA+IHRoYXQ6ICJpZiB0aGUgc3VwZXJibG9jayBpcyBhbHJlYWR5
IG1vdW50ZWQgYnV0IHdlIGNhbiBzaHJpbmsgdGhlIHdob2xlCj4gPiBkY2FjaGUsIHRoZW4gZG8g
cmVtb3VudCBpbnN0ZWFkIG9mIGlnbm9yaW5nIG1vdW50IG9wdGlvbnMiLiBGaXJzdGx5LCB0aGlz
Cj4gPiBsb29rcyByYWN5IC0gd2hhdCBwcmV2ZW50cyBzb21lb25lIGZyb20gc2F5IG9wZW5pbmcg
YSBmaWxlIG9uIHRoZSBzYiBqdXN0Cj4gPiBhZnRlciBuaWxmc190cmVlX2lzX2J1c3koKSBzaHJp
bmtzIGRjYWNoZT8gU2Vjb25kbHksIGl0IGlzIGluY29uc2lzdGVudAo+ID4gd2l0aCBhbnkgb3Ro
ZXIgZmlsZXN5c3RlbSBzbyBpdCdzIGdvaW5nIHRvIHN1cnByaXNlIHN5c2FkbWlucyBub3QKPiA+
IGludGltYXRlbHkga25vd2luZyBuaWxmczIuIFRoaXJkbHksIGZyb20gdXNlcnNwYWNlIHlvdSBj
YW5ub3QgdGVsbCB3aGF0Cj4gPiB5b3VyIG1vdW50IGNhbGwgaXMgZ29pbmcgdG8gZG8uIExhc3Qg
YnV0IG5vdCBsZWFzdCwgd2hhdCBpcyBpdCByZWFsbHkgZ29vZAo+ID4gZm9yPyBSeXVzdWtlLCBj
YW4geW91IGV4cGxhaW4gcGxlYXNlPwo+ID4KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBIb256YQo+IAo+IEkgdGhpbmsg
eW91IGFyZSByZWZlcnJpbmcgdG8gdGhlIGZvbGxvd2luZyBwYXJ0Ogo+IAo+ID4gICAgICAgIGlm
ICghcy0+c19yb290KSB7Cj4gLi4uCj4gPiAgICAgICAgfSBlbHNlIGlmICghc2QuY25vKSB7Cj4g
PiAgICAgICAgICAgICAgICBpZiAobmlsZnNfdHJlZV9pc19idXN5KHMtPnNfcm9vdCkpIHsKPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgaWYgKChmbGFncyBeIHMtPnNfZmxhZ3MpICYgU0JfUkRP
TkxZKSB7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbmlsZnNfZXJyKHMsCj4g
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJ0aGUgZGV2aWNlIGFs
cmVhZHkgaGFzIGEgJXMgbW91bnQuIiwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgc2JfcmRvbmx5KHMpID8gInJlYWQtb25seSIgOiAicmVhZC93cml0ZSIpOwo+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVyciA9IC1FQlVTWTsKPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIGZhaWxlZF9zdXBlcjsKPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgfQo+ID4gICAgICAgICAgICAgICAgfSBlbHNlIHsKPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgLyoKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICogVHJ5IHJlbW91
bnQgdG8gc2V0dXAgbW91bnQgc3RhdGVzIGlmIHRoZSBjdXJyZW50Cj4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICAqIHRyZWUgaXMgbm90IG1vdW50ZWQgYW5kIG9ubHkgc25hcHNob3RzIHVzZSB0
aGlzIHNiLgo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgKi8KPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgZXJyID0gbmlsZnNfcmVtb3VudChzLCAmZmxhZ3MsIGRhdGEpOwo+ID4gICAgICAg
ICAgICAgICAgICAgICAgICBpZiAoZXJyKQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGdvdG8gZmFpbGVkX3N1cGVyOwo+ID4gICAgICAgICAgICAgICAgfQo+ID4gICAgICAgIH0K
PiAKPiBXaGF0IHRoaXMgbG9naWMgaXMgdHJ5aW5nIHRvIGRvIGlzLCBpZiB0aGVyZSBpcyBhbHJl
YWR5IGEgbmlsZnMyIG1vdW50Cj4gaW5zdGFuY2UgZm9yIHRoZSBkZXZpY2UsIGFuZCBhcmUgdHJ5
aW5nIHRvIG1vdW50aW5nIHRoZSBjdXJyZW50IHRyZWUKPiAoc2QuY25vIGlzIDAsIHNvIHRoaXMg
aXMgbm90IGEgc25hcHNob3QgbW91bnQpLCB0aGVuIHdpbGwgc3dpdGNoCj4gZGVwZW5kaW5nIG9u
IHdoZXRoZXIgdGhlIGN1cnJlbnQgdHJlZSBoYXMgYSBtb3VudDoKPiAKPiAtIElmIHRoZSBjdXJy
ZW50IHRyZWUgaXMgbW91bnRlZCwgaXQncyBqdXN0IGxpa2UgYSBub3JtYWwgZmlsZXN5c3RlbS4K
PiAoQSByZWFkLW9ubHkgbW91bnQgYW5kIGEgcmVhZC93cml0ZSBtb3VudCBjYW4ndCBjb2V4aXN0
LCBzbyBjaGVjawo+IHRoYXQsIGFuZCByZXVzZSB0aGUgaW5zdGFuY2UgaWYgcG9zc2libGUpCj4g
LSBPdGhlcndpc2UsIGkuZS4gZm9yIHNuYXBzaG90IG1vdW50cyBvbmx5LCBkbyB3aGF0ZXZlciBp
cyBuZWNlc3NhcnkKPiB0byBhZGQgYSBuZXcgY3VycmVudCBtb3VudCwgc3VjaCBhcyBzdGFydGlu
ZyBhIGxvZyB3cml0ZXIuCj4gICAgU2luY2UgaXQgZG9lcyB0aGUgc2FtZSB0aGluZyB0aGF0IG5p
bGZzX3JlbW91bnQgZG9lcywgc28KPiBuaWxmc19yZW1vdW50KCkgaXMgdXNlZCB0aGVyZS4KPiAK
PiBXaGV0aGVyIG9yIG5vdCB0aGVyZSBpcyBhIGN1cnJlbnQgdHJlZSBtb3VudCBjYW4gYmUgZGV0
ZXJtaW5lZCBieQo+IGRfY291bnQocy0+c19yb290KSA+IDEgYXMgbmlsZnNfdHJlZV9pc19idXN5
KCkgZG9lcy4KPiBXaGVyZSBzLT5zX3Jvb3QgaXMgYWx3YXlzIHRoZSByb290IGRlbnRyeSBvZiB0
aGUgY3VycmVudCB0cmVlLCBub3QKPiB0aGF0IG9mIHRoZSBtb3VudGVkIHNuYXBzaG90LgoKSSBz
ZWUgbm93LCB0aGFua3MgZm9yIGV4cGxhbmF0aW9uISBCdXQgb25lIHRoaW5nIHN0aWxsIGlzIG5v
dCBjbGVhciB0byBtZS4KSWYgeW91IHNheSBoYXZlIGEgc25hcHNob3QgbW91bnRlZCByZWFkLXdy
aXRlIGFuZCB0aGVuIHlvdSBtb3VudCB0aGUKY3VycmVudCBzbmFwc2hvdCAoY25vID09IDApIHJl
YWQtb25seSwgeW91J2xsIHN3aXRjaCB0aGUgd2hvbGUgc3VwZXJibG9jawp0byByZWFkLW9ubHkg
c3RhdGUuIFNvIGFsc28gdGhlIG1vdW50ZWQgc25hcHNob3QgaXMgc3VkZGVudGx5IHJlYWQtb25s
eQp3aGljaCBpcyB1bmV4cGVjdGVkIGFuZCBhY3R1YWxseSBzdXBwb3NlZGx5IGJyZWFrcyB0aGlu
Z3MgYmVjYXVzZSB5b3UgY2FuCnN0aWxsIGhhdmUgZmlsZSBoYW5kbGVzIG9wZW4gZm9yIHdyaXRp
bmcgb24gdGhlIHNuYXBzaG90IGV0Yy4uIFNvIGhvdyBkbwp5b3Ugc29sdmUgdGhhdD8KCgkJCQkJ
CQkJSG9uemEKLS0gCkphbiBLYXJhIDxqYWNrQHN1c2UuY29tPgpTVVNFIExhYnMsIENSCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1k
ZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQK
aHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1k
ZXZlbAo=
