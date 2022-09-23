Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3819F5E7DAD
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Sep 2022 16:55:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1obk52-00040N-Gl;
	Fri, 23 Sep 2022 14:55:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@collabora.com>) id 1obk4q-0003zw-Hs
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Sep 2022 14:54:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:In-Reply-To:
 Date:References:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bHvMBZe+GTLqz4WOZW72rOxtYTnouWMTfB8h6gEdlb8=; b=PBJ2Tm2J3oYdxqyHFCuZHqAbkq
 ioCmYaNDd7svVwaLbWwhyiOfQD+25OoUYtYRtZ+ksbI8weBx/d4KM3G4O4hkKT4PyOXtphWfQ9794
 pWLhg1lWIzyD88nDzi+m6aJ1wuO4fUrL82BooM3L4layviMfF0DPhm4DzTAFXv7jzOYI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bHvMBZe+GTLqz4WOZW72rOxtYTnouWMTfB8h6gEdlb8=; b=BKPcun7vmaca8vovVBltiDm7mH
 ybcYZR/ZWrE84lcDCZisBANdq7QaLxLzM2HNYj4pjS8/vLGSWsOtO+C/k2PP3kFeodBRDsjGL4zGc
 vD/K/HMcaYAj1xb5p90cj1kRGelUB/ZDUq0TaBFCPNzZ6ZgWAzAhE2ypgydoNikYTZFg=;
Received: from madras.collabora.co.uk ([46.235.227.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1obk4g-00068I-KB for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Sep 2022 14:54:46 +0000
Received: from localhost (modemcable141.102-20-96.mc.videotron.ca
 [96.20.102.141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: krisman)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 701A56601A13;
 Fri, 23 Sep 2022 15:54:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663944873;
 bh=oSdWFo0TscxfH7/kryYWf5ZQo2F7LY5OWzR2xISGo9w=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=WNjGZKdT+M9PcqqJxrCNAJrQTPs4i4+VQIUc+vBcj4TMRSXSBSkq1frL2Fd4LFHTk
 wwAbTAkKaOAi0u7eXxRYA9uJeiccIM8Sbo61ytJIayx2c5ebmjqWT/eMcFWgzajb3V
 Ha3S/cetujV9Bx+FReOgHj8awhUVT5PFeI+ynW8asJCyeqjbcEd8JFkw8NrGK4FcE4
 f9iqPcsW39b+9HhGaHDC8OAQ6WTw01EZRqTXxlvyTc/FcTtUPS71AGwb5G70VrBRKd
 GjByrtxuJQVQEsKgsWKMdwNe4dRQ6Cvf51hEUEGJ5SVYJqzKPh0cIsxLj8iqZzd5bY
 K1xh0W6XyDf2w==
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Eric Biggers <ebiggers@kernel.org>
Organization: Collabora
References: <20220913234150.513075-1-krisman@collabora.com>
 <Yy0t8WYhM+Dv3gX1@sol.localdomain>
Date: Fri, 23 Sep 2022 10:54:30 -0400
In-Reply-To: <Yy0t8WYhM+Dv3gX1@sol.localdomain> (Eric Biggers's message of
 "Thu, 22 Sep 2022 20:54:25 -0700")
Message-ID: <87fsgi2lax.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Eric Biggers <ebiggers@kernel.org> writes: > On Tue, Sep 13, 
 2022 at 07:41:42PM -0400, Gabriel Krisman Bertazi wrote: >> Hi, >> >> I'm
 resubmitting this as v9 since I think it has fallen through the >> cracks
 :). It is a collection of trivial [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1obk4g-00068I-KB
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
Cc: linux-ext4@vger.kernel.org, tytso@mit.edu,
 linux-f2fs-devel@lists.sourceforge.net, adilger.kernel@dilger.ca,
 jaegeuk@kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Eric Biggers <ebiggers@kernel.org> writes:

> On Tue, Sep 13, 2022 at 07:41:42PM -0400, Gabriel Krisman Bertazi wrote:
>> Hi,
>> 
>> I'm resubmitting this as v9 since I think it has fallen through the
>> cracks :).  It is a collection of trivial fixes for casefold support on
>> ext4/f2fs. More details below.
>> 
>> It has been sitting on the list for a while and most of it is r-b
>> already. I'm keeping the tags for this submission, since there is no
>> modifications from previous submissions, apart from a minor conflict
>> resolution when merging to linus/master.
>
> Who are you expecting to apply this?

Hi Eric,

There are three groups of changes here: libfs, ext4 and f2fs.  Since the
changes in libfs are self-contained and only affect these two
filesystems, I think it should be fine for them to go through a fs tree.

The bulk of changes are ext4, and Ted mentioned on an earlier version
that he could pick the first patches of this series, so I'm thinking it
should all go through the ext4 tree.  If Jaegeuk acks, the f2fs changes
are safe to go with the rest, or I can send them afterwards as a
separate series once the libfs code is merged.

Thanks,

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
