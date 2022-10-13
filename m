Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC7E5FE612
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Oct 2022 02:09:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oj8GL-0005M9-Nu;
	Fri, 14 Oct 2022 00:09:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <gabriel@krisman.be>) id 1oj8GJ-0005M3-To
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Oct 2022 00:09:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:In-Reply-To:
 Date:References:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6AoRxkw5VMVRk5KeY67RfUOX9XRHNeBTxQdmVl/KoLY=; b=SYKJM96bsbvaPZ3alZbDwmnIBt
 vl4Aw02OgUGX7t9VglRgzDTewIJCVslipkF+m7VHThpbABazxhlHvnic2xy+H3rvsTZ4k+Comu4pi
 zslOMcumiU5JxKjvu1q7ZGxUJ1zt8Yqzf4pL+GYgr08CPGCFUMorSuUTPFzjTprWCoN4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6AoRxkw5VMVRk5KeY67RfUOX9XRHNeBTxQdmVl/KoLY=; b=cEflLLgGDKfrB1H2YbX3vYwvzo
 mCqGrCUwZJKcTSTtIaN6UybilC4+CzBklIbBpEvz+49LQaSMrvg/Es7QrEF9KBkvgSdU5+bGuzHQs
 WubSWrDgJiBcLYf4ymxJmG0bnowFELyhrLahwksZKvP+ybUGJ1rbca42Ra6d24AVd66E=;
Received: from mslow1.mail.gandi.net ([217.70.178.240])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oj8G5-002wuo-S7 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Oct 2022 00:09:15 +0000
Received: from relay7-d.mail.gandi.net (unknown [217.70.183.200])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 50311C98DB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 13 Oct 2022 23:45:40 +0000 (UTC)
Received: (Authenticated sender: gabriel@krisman.be)
 by mail.gandi.net (Postfix) with ESMTPSA id 9CE5A20005;
 Thu, 13 Oct 2022 23:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=krisman.be; s=gm1;
 t=1665704733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6AoRxkw5VMVRk5KeY67RfUOX9XRHNeBTxQdmVl/KoLY=;
 b=XItFjwiglg9Yb+V7d7AuJUzWGUG+sDNMOIgL4E1L/uGjP7HNzhjoQ5AqE3E2042Bf+vCEc
 umH7bGcmJZir1vk54lAxPiJOGhiHpA7OxBygOfrgUWkiKmRY3JUcVAnHPjZRVQbI9XKzVb
 GEjfmofDGOZdukOaEVj2Pij+jrUIlVbRiydJlId3B1798lpHPzUmyk0o8ZLscabGX6S/TV
 i5zaOemBSxUUsd9uioD3tCcgNeDjtfD1NgTlwtI9HyU9mOG5ypWYnfGXdIZerzzUIRXSPA
 uRrz3vSaB9v0/qIVfx6inDREoD7pRu7iaZIQzRn5K6ebeuCKXDL0c6kLZpMq/w==
From: Gabriel Krisman Bertazi <gabriel@krisman.be>
To: tytso@mit.edu
References: <20220913234150.513075-1-krisman@collabora.com>
 <Yy0t8WYhM+Dv3gX1@sol.localdomain> <87fsgi2lax.fsf@collabora.com>
Date: Thu, 13 Oct 2022 19:45:29 -0400
In-Reply-To: <87fsgi2lax.fsf@collabora.com> (Gabriel Krisman Bertazi's message
 of "Fri, 23 Sep 2022 10:54:30 -0400")
Message-ID: <87tu47thie.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Gabriel Krisman Bertazi <krisman@collabora.com> writes: >
 Eric Biggers <ebiggers@kernel.org> writes: > >> On Tue, Sep 13,
 2022 at 07:41:42PM
 -0400, Gabriel Krisman Bertazi wrote: >>> Hi, >>> >>> I'm resubmitting this
 as v9 since I think it has fallen throu [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [217.70.178.240 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1oj8G5-002wuo-S7
Subject: Re: [f2fs-dev] [PATCH v9 0/8] Clean up the case-insensitive lookup
 path
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
Cc: kernel@collabora.com, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, adilger.kernel@dilger.ca,
 jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Gabriel Krisman Bertazi <krisman@collabora.com> writes:

> Eric Biggers <ebiggers@kernel.org> writes:
>
>> On Tue, Sep 13, 2022 at 07:41:42PM -0400, Gabriel Krisman Bertazi wrote:
>>> Hi,
>>> 
>>> I'm resubmitting this as v9 since I think it has fallen through the
>>> cracks :).  It is a collection of trivial fixes for casefold support on
>>> ext4/f2fs. More details below.
>>> 
>>> It has been sitting on the list for a while and most of it is r-b
>>> already. I'm keeping the tags for this submission, since there is no
>>> modifications from previous submissions, apart from a minor conflict
>>> resolution when merging to linus/master.
>>
>> Who are you expecting to apply this?
>
> Hi Eric,
>
> There are three groups of changes here: libfs, ext4 and f2fs.  Since the
> changes in libfs are self-contained and only affect these two
> filesystems, I think it should be fine for them to go through a fs tree.
>
> The bulk of changes are ext4, and Ted mentioned on an earlier version
> that he could pick the first patches of this series, so I'm thinking it
> should all go through the ext4 tree.  If Jaegeuk acks, the f2fs changes
> are safe to go with the rest, or I can send them afterwards as a
> separate series once the libfs code is merged.

Ted,

Does the above plan work for you? Do you intend to pick this up for the
next merge window?

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
