Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E98F778010
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Aug 2023 20:14:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qUABC-0000ON-Rq;
	Thu, 10 Aug 2023 18:14:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1qUABB-0000OG-BS
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Aug 2023 18:14:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EtACbPUf2jciroUOwqpt2N6vNFZggLTp4OAzqG/4taE=; b=ibMKqN2rtg/7E4PmDEKDSD3sk8
 FUWlkSVy3gktadIVb+Vd5LSTcE0UdrySI+XMveL1EkP77gg1wn6/yqIOWsOCH6K8nyNLvurtBpoGU
 0Sn8AfaOrPA1knZ8x+Kv+1+HcP9Dqx+1P28xVrhQTlSsJGKzjZU2jQHEVTeazT0Au+e4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EtACbPUf2jciroUOwqpt2N6vNFZggLTp4OAzqG/4taE=; b=DDQS03CyCC7O0dJSO4gPMAf+pt
 zoH6VT+BDle7EmgSQOtwe2xANSghrA/XfFkwm/IlbJpUqmeHNjU6HrE3aUqJxfDjjRFXae+MqrMnC
 +2/RMOPMMNpo62gL9XgS1H9u4qZ3U0KPPdp/4hLjmrJrD7q2YpxB+n2uMslzsdsBQu0U=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qUAB8-001sdt-Gw for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Aug 2023 18:14:38 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B203A1F45B;
 Thu, 10 Aug 2023 18:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1691691263; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EtACbPUf2jciroUOwqpt2N6vNFZggLTp4OAzqG/4taE=;
 b=y0bjlm1WNB3Ygc3dgC3Kv8bc5ZJyIxCe9ta+2EwqzpPoGdBb6TSGISmCiwJa3S+0U7Q35G
 +4djJF18Qc6Z1325CwpU9HDJU/IBkfJZfzExHWfm0GZE8wxvxQXYKjn8MGr08DUX4RI9m+
 jxkKrBwNHD6TBJZX6w5lOET4v8eOeCM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1691691263;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EtACbPUf2jciroUOwqpt2N6vNFZggLTp4OAzqG/4taE=;
 b=7PjYFUIKEw1GXEov7YN9IhoFXZPsyn4524+pgBxoltMvENURUdC4NVCBm+H0l+iWNYGZT1
 L46pv46dVdE2PXBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9C4B6138E2;
 Thu, 10 Aug 2023 18:14:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id o0waJv8o1WRkYwAAMHmgww
 (envelope-from <jack@suse.cz>); Thu, 10 Aug 2023 18:14:23 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 1B1B9A076F; Thu, 10 Aug 2023 20:14:23 +0200 (CEST)
Date: Thu, 10 Aug 2023 20:14:23 +0200
From: Jan Kara <jack@suse.cz>
To: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Message-ID: <20230810181423.dfz3lrezwvutls2w@quack3>
References: <20230802154131.2221419-1-hch@lst.de>
 <20230802154131.2221419-3-hch@lst.de>
 <20230803114651.ihtqqgthbdjjgxev@quack3>
 <CAKFNMomzHg33SHnp6xGMEZY=+k6Y4t7dvBvgBDbO9H3ujzNDCw@mail.gmail.com>
 <20230810110547.ks62g2flysgwpgru@quack3>
 <CAKFNMon_3A7dC+k1q_RjEnoXXNtxBJAUQud_FD4s4VrHZdCVzg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKFNMon_3A7dC+k1q_RjEnoXXNtxBJAUQud_FD4s4VrHZdCVzg@mail.gmail.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Fri 11-08-23 01:39:10, Ryusuke Konishi wrote: > On Thu,
    Aug 10, 2023 at 8:05 PM Jan Kara wrote: > > > > On Fri 04-08-23 11:01:39,
    Ryusuke Konishi wrote: > > > On Thu, Aug 3, 2023 at 8:46 PM Jan [...] 
 
 Content analysis details:   (-2.5 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [195.135.220.29 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
X-Headers-End: 1qUAB8-001sdt-Gw
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

T24gRnJpIDExLTA4LTIzIDAxOjM5OjEwLCBSeXVzdWtlIEtvbmlzaGkgd3JvdGU6Cj4gT24gVGh1
LCBBdWcgMTAsIDIwMjMgYXQgODowNeKAr1BNIEphbiBLYXJhIHdyb3RlOgo+ID4KPiA+IE9uIEZy
aSAwNC0wOC0yMyAxMTowMTozOSwgUnl1c3VrZSBLb25pc2hpIHdyb3RlOgo+ID4gPiBPbiBUaHUs
IEF1ZyAzLCAyMDIzIGF0IDg6NDbigK9QTSBKYW4gS2FyYSB3cm90ZToKPiA+ID4gPgo+ID4gPiA+
IE9uIFdlZCAwMi0wOC0yMyAxNzo0MToyMSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gPiA+
ID4gPiBVc2UgdGhlIGdlbmVyaWMgc2V0dXBfYmRldl9zdXBlciBoZWxwZXIgdG8gb3BlbiB0aGUg
bWFpbiBibG9jayBkZXZpY2UKPiA+ID4gPiA+IGFuZCBkbyB2YXJpb3VzIGJpdHMgb2Ygc3VwZXJi
bG9jayBzZXR1cCBpbnN0ZWFkIG9mIGR1cGxpY2F0aW5nIHRoZQo+ID4gPiA+ID4gbG9naWMuICBU
aGlzIGluY2x1ZGVzIG1vdmluZyB0byB0aGUgbmV3IHNjaGVtZSBpbXBsZW1lbnRlZCBpbiBjb21t
b24KPiA+ID4gPiA+IGNvZGUgdGhhdCBvbmx5IG9wZW5zIHRoZSBibG9jayBkZXZpY2UgYWZ0ZXIg
dGhlIHN1cGVyYmxvY2sgaGFzIGFsbG9jYXRlZC4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBJdCBkb2Vz
IG5vdCB5ZXQgY29udmVydCBuaWxmczIgdG8gdGhlIG5ldyBtb3VudCBBUEksIGJ1dCBkb2luZyBz
byB3aWxsCj4gPiA+ID4gPiBiZWNvbWUgYSBiaXQgc2ltcGxlciBhZnRlciB0aGlzIGZpcnN0IHN0
ZXAuCj4gPiA+ID4gPgo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcg
PGhjaEBsc3QuZGU+Cj4gPiA+ID4KPiA+ID4gPiBBRkFJQ1MgbmlsZnMyIGNvdWxkICphbG1vc3Qq
IHVzZSBtb3VudF9iZGV2KCkgZGlyZWN0bHkgYW5kIHRoZW4ganVzdCBkbyBpdHMKPiA+ID4KPiA+
ID4gPiBzbmFwc2hvdCB0aGluZyBhZnRlciBtb3VudF9iZGV2KCkgcmV0dXJucy4gQnV0IGl0IGhh
cyB0aGlzIHdlaXJkIGxvZ2ljCj4gPiA+ID4gdGhhdDogImlmIHRoZSBzdXBlcmJsb2NrIGlzIGFs
cmVhZHkgbW91bnRlZCBidXQgd2UgY2FuIHNocmluayB0aGUgd2hvbGUKPiA+ID4gPiBkY2FjaGUs
IHRoZW4gZG8gcmVtb3VudCBpbnN0ZWFkIG9mIGlnbm9yaW5nIG1vdW50IG9wdGlvbnMiLiBGaXJz
dGx5LCB0aGlzCj4gPiA+ID4gbG9va3MgcmFjeSAtIHdoYXQgcHJldmVudHMgc29tZW9uZSBmcm9t
IHNheSBvcGVuaW5nIGEgZmlsZSBvbiB0aGUgc2IganVzdAo+ID4gPiA+IGFmdGVyIG5pbGZzX3Ry
ZWVfaXNfYnVzeSgpIHNocmlua3MgZGNhY2hlPyBTZWNvbmRseSwgaXQgaXMgaW5jb25zaXN0ZW50
Cj4gPiA+ID4gd2l0aCBhbnkgb3RoZXIgZmlsZXN5c3RlbSBzbyBpdCdzIGdvaW5nIHRvIHN1cnBy
aXNlIHN5c2FkbWlucyBub3QKPiA+ID4gPiBpbnRpbWF0ZWx5IGtub3dpbmcgbmlsZnMyLiBUaGly
ZGx5LCBmcm9tIHVzZXJzcGFjZSB5b3UgY2Fubm90IHRlbGwgd2hhdAo+ID4gPiA+IHlvdXIgbW91
bnQgY2FsbCBpcyBnb2luZyB0byBkby4gTGFzdCBidXQgbm90IGxlYXN0LCB3aGF0IGlzIGl0IHJl
YWxseSBnb29kCj4gPiA+ID4gZm9yPyBSeXVzdWtlLCBjYW4geW91IGV4cGxhaW4gcGxlYXNlPwo+
ID4gPiA+Cj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIEhvbnphCj4gPiA+Cj4gPiA+IEkgdGhpbmsgeW91IGFyZSBy
ZWZlcnJpbmcgdG8gdGhlIGZvbGxvd2luZyBwYXJ0Ogo+ID4gPgo+ID4gPiA+ICAgICAgICBpZiAo
IXMtPnNfcm9vdCkgewo+ID4gPiAuLi4KPiA+ID4gPiAgICAgICAgfSBlbHNlIGlmICghc2QuY25v
KSB7Cj4gPiA+ID4gICAgICAgICAgICAgICAgaWYgKG5pbGZzX3RyZWVfaXNfYnVzeShzLT5zX3Jv
b3QpKSB7Cj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICBpZiAoKGZsYWdzIF4gcy0+c19m
bGFncykgJiBTQl9SRE9OTFkpIHsKPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgbmlsZnNfZXJyKHMsCj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAidGhlIGRldmljZSBhbHJlYWR5IGhhcyBhICVzIG1vdW50LiIsCj4gPiA+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzYl9yZG9ubHkocykgPyAicmVh
ZC1vbmx5IiA6ICJyZWFkL3dyaXRlIik7Cj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGVyciA9IC1FQlVTWTsKPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZ290byBmYWlsZWRfc3VwZXI7Cj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICB9Cj4g
PiA+ID4gICAgICAgICAgICAgICAgfSBlbHNlIHsKPiA+ID4gPiAgICAgICAgICAgICAgICAgICAg
ICAgIC8qCj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgKiBUcnkgcmVtb3VudCB0byBz
ZXR1cCBtb3VudCBzdGF0ZXMgaWYgdGhlIGN1cnJlbnQKPiA+ID4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICAqIHRyZWUgaXMgbm90IG1vdW50ZWQgYW5kIG9ubHkgc25hcHNob3RzIHVzZSB0aGlz
IHNiLgo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICovCj4gPiA+ID4gICAgICAgICAg
ICAgICAgICAgICAgICBlcnIgPSBuaWxmc19yZW1vdW50KHMsICZmbGFncywgZGF0YSk7Cj4gPiA+
ID4gICAgICAgICAgICAgICAgICAgICAgICBpZiAoZXJyKQo+ID4gPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBnb3RvIGZhaWxlZF9zdXBlcjsKPiA+ID4gPiAgICAgICAgICAgICAg
ICB9Cj4gPiA+ID4gICAgICAgIH0KPiA+ID4KPiA+ID4gV2hhdCB0aGlzIGxvZ2ljIGlzIHRyeWlu
ZyB0byBkbyBpcywgaWYgdGhlcmUgaXMgYWxyZWFkeSBhIG5pbGZzMiBtb3VudAo+ID4gPiBpbnN0
YW5jZSBmb3IgdGhlIGRldmljZSwgYW5kIGFyZSB0cnlpbmcgdG8gbW91bnRpbmcgdGhlIGN1cnJl
bnQgdHJlZQo+ID4gPiAoc2QuY25vIGlzIDAsIHNvIHRoaXMgaXMgbm90IGEgc25hcHNob3QgbW91
bnQpLCB0aGVuIHdpbGwgc3dpdGNoCj4gPiA+IGRlcGVuZGluZyBvbiB3aGV0aGVyIHRoZSBjdXJy
ZW50IHRyZWUgaGFzIGEgbW91bnQ6Cj4gPiA+Cj4gPiA+IC0gSWYgdGhlIGN1cnJlbnQgdHJlZSBp
cyBtb3VudGVkLCBpdCdzIGp1c3QgbGlrZSBhIG5vcm1hbCBmaWxlc3lzdGVtLgo+ID4gPiAoQSBy
ZWFkLW9ubHkgbW91bnQgYW5kIGEgcmVhZC93cml0ZSBtb3VudCBjYW4ndCBjb2V4aXN0LCBzbyBj
aGVjawo+ID4gPiB0aGF0LCBhbmQgcmV1c2UgdGhlIGluc3RhbmNlIGlmIHBvc3NpYmxlKQo+ID4g
PiAtIE90aGVyd2lzZSwgaS5lLiBmb3Igc25hcHNob3QgbW91bnRzIG9ubHksIGRvIHdoYXRldmVy
IGlzIG5lY2Vzc2FyeQo+ID4gPiB0byBhZGQgYSBuZXcgY3VycmVudCBtb3VudCwgc3VjaCBhcyBz
dGFydGluZyBhIGxvZyB3cml0ZXIuCj4gPiA+ICAgIFNpbmNlIGl0IGRvZXMgdGhlIHNhbWUgdGhp
bmcgdGhhdCBuaWxmc19yZW1vdW50IGRvZXMsIHNvCj4gPiA+IG5pbGZzX3JlbW91bnQoKSBpcyB1
c2VkIHRoZXJlLgo+ID4gPgo+ID4gPiBXaGV0aGVyIG9yIG5vdCB0aGVyZSBpcyBhIGN1cnJlbnQg
dHJlZSBtb3VudCBjYW4gYmUgZGV0ZXJtaW5lZCBieQo+ID4gPiBkX2NvdW50KHMtPnNfcm9vdCkg
PiAxIGFzIG5pbGZzX3RyZWVfaXNfYnVzeSgpIGRvZXMuCj4gPiA+IFdoZXJlIHMtPnNfcm9vdCBp
cyBhbHdheXMgdGhlIHJvb3QgZGVudHJ5IG9mIHRoZSBjdXJyZW50IHRyZWUsIG5vdAo+ID4gPiB0
aGF0IG9mIHRoZSBtb3VudGVkIHNuYXBzaG90Lgo+ID4KPiA+IEkgc2VlIG5vdywgdGhhbmtzIGZv
ciBleHBsYW5hdGlvbiEgQnV0IG9uZSB0aGluZyBzdGlsbCBpcyBub3QgY2xlYXIgdG8gbWUuCj4g
PiBJZiB5b3Ugc2F5IGhhdmUgYSBzbmFwc2hvdCBtb3VudGVkIHJlYWQtd3JpdGUgYW5kIHRoZW4g
eW91IG1vdW50IHRoZQo+ID4gY3VycmVudCBzbmFwc2hvdCAoY25vID09IDApIHJlYWQtb25seSwg
eW91J2xsIHN3aXRjaCB0aGUgd2hvbGUgc3VwZXJibG9jawo+ID4gdG8gcmVhZC1vbmx5IHN0YXRl
LiBTbyBhbHNvIHRoZSBtb3VudGVkIHNuYXBzaG90IGlzIHN1ZGRlbnRseSByZWFkLW9ubHkKPiA+
IHdoaWNoIGlzIHVuZXhwZWN0ZWQgYW5kIGFjdHVhbGx5IHN1cHBvc2VkbHkgYnJlYWtzIHRoaW5n
cyBiZWNhdXNlIHlvdSBjYW4KPiA+IHN0aWxsIGhhdmUgZmlsZSBoYW5kbGVzIG9wZW4gZm9yIHdy
aXRpbmcgb24gdGhlIHNuYXBzaG90IGV0Yy4uIFNvIGhvdyBkbwo+ID4geW91IHNvbHZlIHRoYXQ/
Cj4gPgo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIEhvbnphCj4gCj4gT25lIHRoaW5nIEkgaGF2ZSB0byB0ZWxsIHlvdSBh
cyBhIHByZW1pc2UgaXMgdGhhdCBuaWxmczIncyBzbmFwc2hvdAo+IG1vdW50cyAoY25vICE9IDAp
IGFyZSByZWFkLW9ubHkuCj4gCj4gVGhlIHJlYWQtb25seSBvcHRpb24gaXMgbWFuZGF0b3J5IGZv
ciBuaWxmczIgc25hcHNob3QgbW91bnRzLCBzbwo+IHJlbW91bnRpbmcgdG8gcmVhZC93cml0ZSBt
b2RlIHdpbGwgcmVzdWx0IGluIGFuIGVycm9yLgo+IFRoaXMgY29uc3RyYWludCBpcyBjaGVja2Vk
IGluIG5pbGZzX3BhcnNlX3NuYXBzaG90X29wdGlvbigpIHdoaWNoIGlzCj4gY2FsbGVkIGZyb20g
bmlsZnNfaWRlbnRpZnkoKS4KPiAKPiBJbiBmYWN0LCBhbnkgd3JpdGUgbW9kZSBmaWxlL2lub2Rl
IG9wZXJhdGlvbnMgb24gYSBzbmFwc2hvdCBtb3VudCB3aWxsCj4gcmVzdWx0IGluIGFuIEVST0ZT
IGVycm9yLCByZWdhcmRsZXNzIG9mIHdoZXRoZXIgdGhlIGNvZXhpc3RpbmcgY3VycmVudAo+IHRy
ZWUgbW91bnQgaXMgcmVhZC1vbmx5IG9yIHJlYWQvd3JpdGUgKGkuZS4gcmVnYXJkbGVzcyBvZiB0
aGUKPiByZWFkLW9ubHkgZmxhZyBvZiB0aGUgc3VwZXJibG9jayBpbnN0YW5jZSkuCj4gCj4gVGhp
cyBpcyBtb3N0bHkgKGFuZCBwb3NzaWJseSBlbnRpcmVseSkgYWNjb21wbGlzaGVkIGF0IHRoZSB2
ZnMgbGF5ZXIKPiBieSBjaGVja2luZyB0aGUgTU5UX1JFQURPTkxZIGZsYWcgaW4gbW50X2ZsYWdz
IG9mIHRoZSB2ZnNtb3VudAo+IHN0cnVjdHVyZSwgYW5kIGV2ZW4gb24gdGhlIG5pbGZzMiBzaWRl
LCAgaW9wcy0+cGVybWlzc2lvbgo+ICg9bmlsZnNfcGVybWlzc2lvbikgcmVqZWN0cyB3cml0ZSBv
cGVyYXRpb25zIG9uIHNuYXBzaG90IG1vdW50cy4KPiAKPiBUaGVyZWZvcmUsIHRoZSBwcm9ibGVt
IHlvdSBwb2ludGVkIG91dCBzaG91bGRuJ3Qgb2NjdXIgaW4gdGhlIGZpcnN0Cj4gcGxhY2Ugc2lu
Y2UgdGhlIHNpdHVhdGlvbiB3aGVyZSBhIHNuYXBzaG90IHdpdGggYSBoYW5kbGUgaW4gd3JpdGUg
bW9kZQo+IHN1ZGRlbmx5IGJlY29tZXMgcmVhZC1vbmx5IGRvZXNuJ3QgaGFwcGVuLiAgIFVubGVz
cyBJJ20gbWlzc2luZwo+IHNvbWV0aGluZy4uCgpObywgSSB0aGluayB5b3UgYXJlIGNvcnJlY3Qu
IFRoaXMgcGFydGljdWxhciBjYXNlIHNob3VsZCBiZSBzYWZlIGJlY2F1c2UKTU5UX1JFQURPTkxZ
IGZsYWdzIG9uIHRoZSBtb3VudHMgdXNlZCBieSBzbmFwc2hvdHMgd2lsbCBzdGlsbCBrZWVwIHRo
ZW0KcmVhZC1vbmx5IGV2ZW4gaWYgeW91IHJlbW91bnQgdGhlIHN1cGVyYmxvY2sgdG8gcmVhZC13
cml0ZSBtb2RlIGZvciB0aGUKY3VycmVudCBzbmFwc2hvdC4gU28gSSBzZWUgd2h5IHRoaXMgaXMg
dXNlZnVsIGFuZCBJIGFncmVlIHRoaXMgaXNuJ3QgZWFzeQp0byBpbXBsZW1lbnQgdXNpbmcgbW91
bnRfYmRldigpIHNvIG5vIHNwZWNpYWwgY29kZSByZWR1Y3Rpb24gaGVyZSA7KS4KVGhhbmtzIGZv
ciBwYXRpZW50IGV4cGxhbmF0aW9uIQoKCQkJCQkJCQlIb256YQotLSAKSmFuIEthcmEgPGphY2tA
c3VzZS5jb20+ClNVU0UgTGFicywgQ1IKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZz
LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5l
dC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
