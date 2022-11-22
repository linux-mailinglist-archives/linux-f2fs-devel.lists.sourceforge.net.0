Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2392A6337BA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Nov 2022 09:59:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oxP7Y-0008La-Bs;
	Tue, 22 Nov 2022 08:59:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <glider@google.com>) id 1oxP74-0008HE-11
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Nov 2022 08:58:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Rjqv25rWWEtR1zBiyBsGJy5jmsV/uC/d3iK5e8meezM=; b=ZDaAHtnDJJCAVDl3r6LjW83AAY
 4UoO/aIfe3XbYnDrfR3/TP7SJOQAxw5RgMurTD1l7gHupX26z303Ml2QmPpqWm4FTGNyjrFicl3uH
 wenIZ5W9gTMEpL/E9MyxKFdy5xxHEmEOwVESAT6usPseRE7zNfkvdU+wVOf6g7UUgZGU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Rjqv25rWWEtR1zBiyBsGJy5jmsV/uC/d3iK5e8meezM=; b=T7KlQ2PpNYLntVwOSihWEZpJFG
 OCqlGH3fzQS0NHH/0iOuhEEPTe8llf3kC+RtwK63oszHi200y3P4OnRmIOjN09Qv0iKm5e3gFrODJ
 rZWeqAeCOEwyUZAx+Duf0hXIk2zGzufC+9qmBoYJahd/QPEXG0zTJLk84/HsbbPjPRKo=;
Received: from mail-yw1-f178.google.com ([209.85.128.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oxP71-0007LJ-LB for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Nov 2022 08:58:41 +0000
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-3704852322fso137784967b3.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 22 Nov 2022 00:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rjqv25rWWEtR1zBiyBsGJy5jmsV/uC/d3iK5e8meezM=;
 b=Debqw6K//5JO0uRGLJgyvzVf+d//XS5xvwBVJOczASNpX3roBvWuTMMgL2e0JreOIV
 x79ORcuLBBHpeltwgRO2Dw9p/gEmQw9HuxuoWl1KUqF45wRc6sY1TqoCo2TYyFLC9vjV
 kyF199DuHalUtiD+xFpIjlwH8mxz/UifToukRr/VF5l57TmMBscERwwp4oWixvaAK11a
 QMhAQAyKIN6ZWGTMn0+BpZRutwJcRpKRijSD8KJwKdAWRE8TnMq9puR1KtTCUSNblthE
 f7vfFmNfiu12LTiXuJJXWFOm/wcXvUywprHB60X+/D+ppLnaw+JphD3h7yTYuOqXhQHn
 Qvjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rjqv25rWWEtR1zBiyBsGJy5jmsV/uC/d3iK5e8meezM=;
 b=dXX6FhHaBROzzDHggzfnh9QZLesiCQipDOf/9lkJOq6y5G5LjPiu38EdPYJgHzjJ3R
 u4nx4sAqDPGV2JBcoHQ0P34RBsfbfsvLLShQJqqYsLIImKTDgVHHKbQewBXZC+k5fJrY
 9HvQChg+OJA/g/eHYAMItV+TYhmntF/CAQLeWFZYLFmBHUBm5i3n+kNNgCx/aiRTImWi
 M/eQzD/RVtk6yJYNfiW2kkjO9+Tvwhlhks6e3O15E0QzqK6ToK4r/idJxpE/fn9ZAYDD
 OZpY4L+Y+YaEecNosWC6fViHnV+s06/2lIq+S8MNoTlbCtnF83uwhGOJ8SOzmjYfPTY7
 uyoA==
X-Gm-Message-State: ANoB5pkZRPPd2Tdg0+XbrytQ7VAc8XxCzX6xrxNZ/R2BTCyHXIASpygp
 /BT8JxXnVNMSoeh9HNDSTr2hRNw3gL3Mg2/NI3uSrQ==
X-Google-Smtp-Source: AA0mqf4wDwK/XWUxdraM37iTax/qOyyWnB+16Ye1sv/PKOtKjjqKpBpldGte1NW/BYAV+FAvU13uBdvUK1Pp3cuqfXc=
X-Received: by 2002:a81:dd05:0:b0:36e:8228:a127 with SMTP id
 e5-20020a81dd05000000b0036e8228a127mr2737632ywn.299.1669107513776; Tue, 22
 Nov 2022 00:58:33 -0800 (PST)
MIME-Version: 1.0
References: <20221121112134.407362-1-glider@google.com>
 <20221121112134.407362-2-glider@google.com>
 <Y3vVp/2A9nao8HZ2@gmail.com>
In-Reply-To: <Y3vVp/2A9nao8HZ2@gmail.com>
Date: Tue, 22 Nov 2022 09:57:57 +0100
Message-ID: <CAG_fn=VA=ZDX4mLruDAMsMa1o11s7c9B9n3k7vohwFu2dpUmAA@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -15.7 (---------------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Nov 21,
 2022 at 8:46 PM Eric Biggers <ebiggers@kernel.org>
 wrote: > > On Mon, Nov 21, 2022 at 12:21:31PM +0100, Alexander Potapenko
 wrote: > > When aops->write_begin() does not initialize fsda [...] 
 Content analysis details:   (-15.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF
 white-list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.178 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.178 listed in wl.mailspike.net]
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL
 Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1oxP71-0007LJ-LB
Subject: Re: [f2fs-dev] [PATCH 2/5] fs: affs: initialize fsdata in
 affs_truncate()
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
From: Alexander Potapenko via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Alexander Potapenko <glider@google.com>
Cc: tytso@mit.edu, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, adilger.kernel@dilger.ca,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gTW9uLCBOb3YgMjEsIDIwMjIgYXQgODo0NiBQTSBFcmljIEJpZ2dlcnMgPGViaWdnZXJzQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gTW9uLCBOb3YgMjEsIDIwMjIgYXQgMTI6MjE6MzFQTSAr
MDEwMCwgQWxleGFuZGVyIFBvdGFwZW5rbyB3cm90ZToKPiA+IFdoZW4gYW9wcy0+d3JpdGVfYmVn
aW4oKSBkb2VzIG5vdCBpbml0aWFsaXplIGZzZGF0YSwgS01TQU4gbWF5IHJlcG9ydAo+ID4gYW4g
ZXJyb3IgcGFzc2luZyB0aGUgbGF0dGVyIHRvIGFvcHMtPndyaXRlX2VuZCgpLgo+ID4KPiA+IEZp
eCB0aGlzIGJ5IHVuY29uZGl0aW9uYWxseSBpbml0aWFsaXppbmcgZnNkYXRhLgo+ID4KPiA+IFN1
Z2dlc3RlZC1ieTogRXJpYyBCaWdnZXJzIDxlYmlnZ2Vyc0BrZXJuZWwub3JnPgo+ID4gRml4ZXM6
IDFkYTE3N2U0YzNmNCAoIkxpbnV4LTIuNi4xMi1yYzIiKQo+Cj4gQXJlIHlvdSBzdXJlIHRoYXQg
aXMgdGhlIGNvcnJlY3QgRml4ZXMgY29tbWl0PyAgV2hhdCBhYm91dCBjb21taXQgZjJiNmExNmVi
OGY1Cj4gKCJmczogYWZmcyBjb252ZXJ0IHRvIG5ldyBhb3BzIik/CgpIbW0sIGluZGVlZCwgeW91
IGFyZSByaWdodC4KCj4gLSBFcmljCgoKCi0tIApBbGV4YW5kZXIgUG90YXBlbmtvClNvZnR3YXJl
IEVuZ2luZWVyCgpHb29nbGUgR2VybWFueSBHbWJICkVyaWthLU1hbm4tU3RyYcOfZSwgMzMKODA2
MzYgTcO8bmNoZW4KCkdlc2Now6RmdHNmw7xocmVyOiBQYXVsIE1hbmljbGUsIExpYW5hIFNlYmFz
dGlhbgpSZWdpc3RlcmdlcmljaHQgdW5kIC1udW1tZXI6IEhhbWJ1cmcsIEhSQiA4Njg5MQpTaXR6
IGRlciBHZXNlbGxzY2hhZnQ6IEhhbWJ1cmcKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
