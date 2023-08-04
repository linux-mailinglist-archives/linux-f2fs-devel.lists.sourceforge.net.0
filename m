Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC8B76F768
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Aug 2023 04:02:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qRk8n-00026V-L2;
	Fri, 04 Aug 2023 02:02:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <konishi.ryusuke@gmail.com>) id 1qRk8l-00026P-LZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Aug 2023 02:02:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Li4Rr3SDbAWbMC9vqUARkDUxqa5LNmgwNWmtZCQPN7c=; b=TvSoNcldSMB93qGCI2NWxee+eC
 V3idGeVk2hrONOCJqIHI4/TySRZIdCC7+Ju5ft9f19PyQ2srbIe8XjoiPfVlPQ1sgo2fDq14FkQ5V
 4ENbqU4Mvtk6Ss1YI7NQpdVX0YcGTDmh6eFfWNKqfTEbf4chFv1yI/l1bt9JljsMNs84=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Li4Rr3SDbAWbMC9vqUARkDUxqa5LNmgwNWmtZCQPN7c=; b=ELiGO7MrRRZKvCEq3UUWciToGn
 Z/M9ifRHM5NZvkAscpcz3935soPZqygUX0XyVupK9N3JWHM2RO6ayBZzES22ypfj9pN7NvYJwRxcT
 6Lv7WQ5wL89QNMfdEPWyIu9b4kUdDk1fLxNeWor5uXFucMY8voAsK6H1KfMev2PB9/K0=;
Received: from mail-vs1-f52.google.com ([209.85.217.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qRk8g-0000cl-3m for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Aug 2023 02:02:07 +0000
Received: by mail-vs1-f52.google.com with SMTP id
 ada2fe7eead31-447c7607b72so540106137.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 03 Aug 2023 19:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691114516; x=1691719316;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Li4Rr3SDbAWbMC9vqUARkDUxqa5LNmgwNWmtZCQPN7c=;
 b=MoVB1XjmMagsHZzn9G8ftY6HWJZOUd3UQbdoUZGHvxiTrJtRhQmKpY5hMXxXdiDzuq
 zQBrBD4AM2yCz+AjuuOypK1qRVFL8If5W+fTO+cw9XBWSGuM7Hrx2k1cmlpjp62wiDDF
 xmsVPYq08ScKsEB2acJFU2fLVkjAs3OQk4kUojzHHGQtCjQau8BO/IfSPhWz7s7RoG+F
 ObfsdVyd9J6qFm5iu3TH8pCH6XZy+vWbCGwACVvcWshSg7B1v3rxfId451mLVIpY2bVi
 GasCyfXQI0s3z46olnWXSpFmLflSUgwZZScpT/KeG4Ra5OVORJFyNsdv2rD2oRuBkEtE
 dKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691114516; x=1691719316;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Li4Rr3SDbAWbMC9vqUARkDUxqa5LNmgwNWmtZCQPN7c=;
 b=CPRP3mlAFYyOfHLqMVzjxSzJWekJI8SmmTHt80Bluikti733nwEKh/Gl0Kvo3fobbo
 SbjEmLjHIiDWGx65fTr2DuFXib2W5H70YSl8aBwcSxQAdPAA+eKjDuC3RXO9VOUL8UGO
 PJntxdoxbl941QBfbRGKf+/P5Mjj7aYHIuGtYj3Em4HbofkSXAMqkWzI/M8aH0sKjeYL
 Pui/l49p+4LTUkDq8KnOKwo4vgp19/3SPF7i/V2OQwtUJxm+BlUoTMpGXEgbAILxw8Gg
 +Fr40h1WpsSRLUrwHQZ+dOV6ge2fld0uRan34OaCgeZAdYqQa5SlwLOpGIdFedAXWrRs
 7PoA==
X-Gm-Message-State: AOJu0YzyWjjAOUvhe85IJwn5ZalXxdCrVGRS2sWIUcnzYYWTJiWEbH+/
 0HxPYncxXUORrZNEMJK6DDTf2UHcUVil1NOQ/FQ=
X-Google-Smtp-Source: AGHT+IHATFbengwvPlZLXwXXl9tdvm/xeC68n6I1h9PJY7Qw0FOEZCU8f3gigNz/0f8AxRF04Qwf1gS0iLv+NBKaP4k=
X-Received: by 2002:a05:6102:a35:b0:443:7635:34d with SMTP id
 21-20020a0561020a3500b004437635034dmr329869vsb.30.1691114516008; Thu, 03 Aug
 2023 19:01:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230802154131.2221419-1-hch@lst.de>
 <20230802154131.2221419-3-hch@lst.de>
 <20230803114651.ihtqqgthbdjjgxev@quack3>
In-Reply-To: <20230803114651.ihtqqgthbdjjgxev@quack3>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Fri, 4 Aug 2023 11:01:39 +0900
Message-ID: <CAKFNMomzHg33SHnp6xGMEZY=+k6Y4t7dvBvgBDbO9H3ujzNDCw@mail.gmail.com>
To: Jan Kara <jack@suse.cz>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Thu, Aug 3, 2023 at 8:46 PM Jan Kara wrote: > > On Wed
    02-08-23 17:41:21, Christoph Hellwig wrote: > > Use the generic setup_bdev_super
    helper to open the main block device > > and do various bit [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.217.52 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [konishi.ryusuke[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.217.52 listed in wl.mailspike.net]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1qRk8g-0000cl-3m
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
 Theodore Ts'o <tytso@mit.edu>, linux-fsdevel@vger.kernel.org,
 "Darrick J. Wong" <djwong@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Al Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVGh1LCBBdWcgMywgMjAyMyBhdCA4OjQ24oCvUE0gSmFuIEthcmEgd3JvdGU6Cj4KPiBPbiBX
ZWQgMDItMDgtMjMgMTc6NDE6MjEsIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+ID4gVXNlIHRo
ZSBnZW5lcmljIHNldHVwX2JkZXZfc3VwZXIgaGVscGVyIHRvIG9wZW4gdGhlIG1haW4gYmxvY2sg
ZGV2aWNlCj4gPiBhbmQgZG8gdmFyaW91cyBiaXRzIG9mIHN1cGVyYmxvY2sgc2V0dXAgaW5zdGVh
ZCBvZiBkdXBsaWNhdGluZyB0aGUKPiA+IGxvZ2ljLiAgVGhpcyBpbmNsdWRlcyBtb3ZpbmcgdG8g
dGhlIG5ldyBzY2hlbWUgaW1wbGVtZW50ZWQgaW4gY29tbW9uCj4gPiBjb2RlIHRoYXQgb25seSBv
cGVucyB0aGUgYmxvY2sgZGV2aWNlIGFmdGVyIHRoZSBzdXBlcmJsb2NrIGhhcyBhbGxvY2F0ZWQu
Cj4gPgo+ID4gSXQgZG9lcyBub3QgeWV0IGNvbnZlcnQgbmlsZnMyIHRvIHRoZSBuZXcgbW91bnQg
QVBJLCBidXQgZG9pbmcgc28gd2lsbAo+ID4gYmVjb21lIGEgYml0IHNpbXBsZXIgYWZ0ZXIgdGhp
cyBmaXJzdCBzdGVwLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxo
Y2hAbHN0LmRlPgo+Cj4gQUZBSUNTIG5pbGZzMiBjb3VsZCAqYWxtb3N0KiB1c2UgbW91bnRfYmRl
digpIGRpcmVjdGx5IGFuZCB0aGVuIGp1c3QgZG8gaXRzCgo+IHNuYXBzaG90IHRoaW5nIGFmdGVy
IG1vdW50X2JkZXYoKSByZXR1cm5zLiBCdXQgaXQgaGFzIHRoaXMgd2VpcmQgbG9naWMKPiB0aGF0
OiAiaWYgdGhlIHN1cGVyYmxvY2sgaXMgYWxyZWFkeSBtb3VudGVkIGJ1dCB3ZSBjYW4gc2hyaW5r
IHRoZSB3aG9sZQo+IGRjYWNoZSwgdGhlbiBkbyByZW1vdW50IGluc3RlYWQgb2YgaWdub3Jpbmcg
bW91bnQgb3B0aW9ucyIuIEZpcnN0bHksIHRoaXMKPiBsb29rcyByYWN5IC0gd2hhdCBwcmV2ZW50
cyBzb21lb25lIGZyb20gc2F5IG9wZW5pbmcgYSBmaWxlIG9uIHRoZSBzYiBqdXN0Cj4gYWZ0ZXIg
bmlsZnNfdHJlZV9pc19idXN5KCkgc2hyaW5rcyBkY2FjaGU/IFNlY29uZGx5LCBpdCBpcyBpbmNv
bnNpc3RlbnQKPiB3aXRoIGFueSBvdGhlciBmaWxlc3lzdGVtIHNvIGl0J3MgZ29pbmcgdG8gc3Vy
cHJpc2Ugc3lzYWRtaW5zIG5vdAo+IGludGltYXRlbHkga25vd2luZyBuaWxmczIuIFRoaXJkbHks
IGZyb20gdXNlcnNwYWNlIHlvdSBjYW5ub3QgdGVsbCB3aGF0Cj4geW91ciBtb3VudCBjYWxsIGlz
IGdvaW5nIHRvIGRvLiBMYXN0IGJ1dCBub3QgbGVhc3QsIHdoYXQgaXMgaXQgcmVhbGx5IGdvb2QK
PiBmb3I/IFJ5dXN1a2UsIGNhbiB5b3UgZXhwbGFpbiBwbGVhc2U/Cj4KPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgSG9uemEK
CkkgdGhpbmsgeW91IGFyZSByZWZlcnJpbmcgdG8gdGhlIGZvbGxvd2luZyBwYXJ0OgoKPiAgICAg
ICAgaWYgKCFzLT5zX3Jvb3QpIHsKLi4uCj4gICAgICAgIH0gZWxzZSBpZiAoIXNkLmNubykgewo+
ICAgICAgICAgICAgICAgIGlmIChuaWxmc190cmVlX2lzX2J1c3kocy0+c19yb290KSkgewo+ICAg
ICAgICAgICAgICAgICAgICAgICAgaWYgKChmbGFncyBeIHMtPnNfZmxhZ3MpICYgU0JfUkRPTkxZ
KSB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG5pbGZzX2VycihzLAo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgInRoZSBkZXZpY2UgYWxyZWFkeSBo
YXMgYSAlcyBtb3VudC4iLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgc2JfcmRvbmx5KHMpID8gInJlYWQtb25seSIgOiAicmVhZC93cml0ZSIpOwo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBlcnIgPSAtRUJVU1k7Cj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGdvdG8gZmFpbGVkX3N1cGVyOwo+ICAgICAgICAgICAgICAgICAgICAgICAg
fQo+ICAgICAgICAgICAgICAgIH0gZWxzZSB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAvKgo+
ICAgICAgICAgICAgICAgICAgICAgICAgICogVHJ5IHJlbW91bnQgdG8gc2V0dXAgbW91bnQgc3Rh
dGVzIGlmIHRoZSBjdXJyZW50Cj4gICAgICAgICAgICAgICAgICAgICAgICAgKiB0cmVlIGlzIG5v
dCBtb3VudGVkIGFuZCBvbmx5IHNuYXBzaG90cyB1c2UgdGhpcyBzYi4KPiAgICAgICAgICAgICAg
ICAgICAgICAgICAqLwo+ICAgICAgICAgICAgICAgICAgICAgICAgZXJyID0gbmlsZnNfcmVtb3Vu
dChzLCAmZmxhZ3MsIGRhdGEpOwo+ICAgICAgICAgICAgICAgICAgICAgICAgaWYgKGVycikKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ290byBmYWlsZWRfc3VwZXI7Cj4gICAgICAg
ICAgICAgICAgfQo+ICAgICAgICB9CgpXaGF0IHRoaXMgbG9naWMgaXMgdHJ5aW5nIHRvIGRvIGlz
LCBpZiB0aGVyZSBpcyBhbHJlYWR5IGEgbmlsZnMyIG1vdW50Cmluc3RhbmNlIGZvciB0aGUgZGV2
aWNlLCBhbmQgYXJlIHRyeWluZyB0byBtb3VudGluZyB0aGUgY3VycmVudCB0cmVlCihzZC5jbm8g
aXMgMCwgc28gdGhpcyBpcyBub3QgYSBzbmFwc2hvdCBtb3VudCksIHRoZW4gd2lsbCBzd2l0Y2gK
ZGVwZW5kaW5nIG9uIHdoZXRoZXIgdGhlIGN1cnJlbnQgdHJlZSBoYXMgYSBtb3VudDoKCi0gSWYg
dGhlIGN1cnJlbnQgdHJlZSBpcyBtb3VudGVkLCBpdCdzIGp1c3QgbGlrZSBhIG5vcm1hbCBmaWxl
c3lzdGVtLgooQSByZWFkLW9ubHkgbW91bnQgYW5kIGEgcmVhZC93cml0ZSBtb3VudCBjYW4ndCBj
b2V4aXN0LCBzbyBjaGVjawp0aGF0LCBhbmQgcmV1c2UgdGhlIGluc3RhbmNlIGlmIHBvc3NpYmxl
KQotIE90aGVyd2lzZSwgaS5lLiBmb3Igc25hcHNob3QgbW91bnRzIG9ubHksIGRvIHdoYXRldmVy
IGlzIG5lY2Vzc2FyeQp0byBhZGQgYSBuZXcgY3VycmVudCBtb3VudCwgc3VjaCBhcyBzdGFydGlu
ZyBhIGxvZyB3cml0ZXIuCiAgIFNpbmNlIGl0IGRvZXMgdGhlIHNhbWUgdGhpbmcgdGhhdCBuaWxm
c19yZW1vdW50IGRvZXMsIHNvCm5pbGZzX3JlbW91bnQoKSBpcyB1c2VkIHRoZXJlLgoKV2hldGhl
ciBvciBub3QgdGhlcmUgaXMgYSBjdXJyZW50IHRyZWUgbW91bnQgY2FuIGJlIGRldGVybWluZWQg
YnkKZF9jb3VudChzLT5zX3Jvb3QpID4gMSBhcyBuaWxmc190cmVlX2lzX2J1c3koKSBkb2VzLgpX
aGVyZSBzLT5zX3Jvb3QgaXMgYWx3YXlzIHRoZSByb290IGRlbnRyeSBvZiB0aGUgY3VycmVudCB0
cmVlLCBub3QKdGhhdCBvZiB0aGUgbW91bnRlZCBzbmFwc2hvdC4KCkkgcmVtZW1iZXIgdGhhdCBj
YWxsaW5nIHNocmlua19kY2FjaGVfcGFyZW50KCkgYmVmb3JlIHRoaXMgdGVzdCB3YXMgdG8KZG8g
dGhlIHRlc3QgY29ycmVjdGx5IGlmIHRoZXJlIHdhcyBnYXJiYWdlIGxlZnQgaW4gdGhlIGRjYWNo
ZSBmcm9tIHRoZQpwYXN0IGN1cnJlbnQgbW91bnQuCgpJZiB0aGUgY3VycmVudCB0cmVlIGlzbid0
IG1vdW50ZWQsIGl0IGp1c3QgY2xlYW5zIHVwIHRoZSBnYXJiYWdlLCBhbmQKdGhlIHJlZmVyZW5j
ZSBjb3VudCB3b3VsZG4ndCBoYXZlIGluY3JlbWVudGVkIGluIHBhcmFsbGVsLgoKSWYgdGhlIGN1
cnJlbnQgdHJlZSBpcyBtb3VudGVkLCBkX2NvdW50KHMtPnNfcm9vdCkgd2lsbCBub3QgZGVjcmVh
c2UKdG8gMSwgc28gaXQncyBub3QgYSBwcm9ibGVtLgpIb3dldmVyLCB0aGlzIHdpbGwgY2F1c2Ug
dW5leHBlY3RlZCBkY2FjaGUgc2hyaW5rYWdlIGZvciB0aGUgaW4tdXNlCnRyZWUsIHNvIGl0J3Mg
bm90IGEgZ29vZCBpZGVhLCBhcyB5b3UgcG9pbnRlZCBvdXQuICBJZiB0aGVyZSBpcwphbm90aGVy
IHdheSBvZiBqdWRnaW5nIHdpdGhvdXQgdGhpcyBzaWRlIGVmZmVjdCwgaXQgc2hvdWxkIGJlCnJl
cGxhY2VkLgoKSSB3aWxsIHJlcGx5IGhlcmUgb25jZS4KClJlZ2FyZHMsClJ5dXN1a2UgS29uaXNo
aQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9y
Z2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4
LWYyZnMtZGV2ZWwK
