Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F8EBF5022
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Oct 2025 09:42:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:References:
	In-Reply-To:To:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mtw8OljoD9tIH5I10sDif2u68rA/4lgSaWmTo6GOs4g=; b=iXEooIoSf+ASoNudLY5q3kfPK0
	C6xayibwtECA/H7z0MpuhYVPlKxtvopoI8xFHbmeUAKmyicFippd5JWrvjib7smRpVcS9g+xy+YEQ
	yRtPhGJaPz8N5qCQXyzxDLD/aHSPMSKU1I4NEVtp8f19cu6JBYp4WCcmQ3un+y5f8ODQ=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vB70U-0004wR-9l;
	Tue, 21 Oct 2025 07:42:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=382e81130=mngyadam@amazon.de>)
 id 1vB70S-0004w8-5v for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Oct 2025 07:42:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:CC:To:From:Subject:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8+t9A0kZYWOlwZbL/Kjits3Uw62fi4VAwF1SOn82uzw=; b=cPGHEuzHjbOWQukhfJNt4I21cC
 Dnox8DmZiGH7JuLxvbN3ya3iJs28wEsQ5zeLDONqIBncHIArNoM0eHb3oVAuhWknKZxKT/1E6X3uq
 jh9sNkXdBDTVvd+QJ0tiMFWVjpKmMBqprO1ed9oRfsGOVAyRqUJ5FalFR/1z2OmYx05E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:CC:To:
 From:Subject:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8+t9A0kZYWOlwZbL/Kjits3Uw62fi4VAwF1SOn82uzw=; b=VZ0lt8zG7hBC0gOTnPtyx3rM/T
 KmayEtoIVzaOA4Ex8KLLtHacwWekXcrovSsnBnsBHIVNSGnmGhGDnLx2EYcUZJpYDCfBV2fLsBs6e
 9+XvN9rPTeRBzA5bpaGGzLxzXOK7O/7uXej+TkllyWEbT6eXS21CFa3mRLcADfHqQNDc=;
Received: from fra-out-015.esa.eu-central-1.outbound.mail-perimeter.amazon.com
 ([18.158.153.154]) by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vB70R-0008Qe-F4 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Oct 2025 07:42:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
 t=1761032527; x=1792568527;
 h=from:to:cc:in-reply-to:references:date:message-id:
 mime-version:subject;
 bh=8+t9A0kZYWOlwZbL/Kjits3Uw62fi4VAwF1SOn82uzw=;
 b=fqbdb3+wcDftZwpbX+vN3fhTU/v6KfehHS46ryDSf4f7BoXtEhZuuTr7
 4R70hhcq5vCGKn408N80lMHxo9Zyb5gZWuh1GtKcAaXomOaINfKp150RK
 a9h/qpdHcaLLSmrEsknEaGvVjTgGrUdG4xtGnkurBv7L+JhSfX79pMtgP
 Hiq8+bovBZENQV713CF1n+xT9/Ck/dcK4yqGxr6Or7/M3jdT75u0FjmQX
 Toejvxc5zaOzu9N1urYXlB8IeNWu63BQbC+P1EX0LCejiZ+byFRfZSK5h
 KiDdy1n7QuqZlErkLWOFxECZaEKfESlp/hA+b7J5ECe0GlbQZ2cmDHpmk g==;
X-CSE-ConnectionGUID: TYAeHBJkTkyfK88JJgTexA==
X-CSE-MsgGUID: BLPocVkKTgeQ6UWeWe47Mw==
X-IronPort-AV: E=Sophos;i="6.19,244,1754956800"; 
   d="scan'208";a="3819608"
Received: from ip-10-6-6-97.eu-central-1.compute.internal (HELO
 smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.6.97])
 by internal-fra-out-015.esa.eu-central-1.outbound.mail-perimeter.amazon.com
 with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 07:25:52 +0000
Received: from EX19MTAEUA002.ant.amazon.com [54.240.197.232:2836]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.38.159:2525]
 with esmtp (Farcaster)
 id 06137168-4ab5-48ee-b858-30f80bdf9b8c; Tue, 21 Oct 2025 07:25:51 +0000 (UTC)
X-Farcaster-Flow-ID: 06137168-4ab5-48ee-b858-30f80bdf9b8c
Received: from EX19D013EUB004.ant.amazon.com (10.252.51.92) by
 EX19MTAEUA002.ant.amazon.com (10.252.50.124) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Tue, 21 Oct 2025 07:25:49 +0000
Received: from dev-dsk-mngyadam-1c-cb3f7548.eu-west-1.amazon.com.amazon.de
 (10.253.107.175) by EX19D013EUB004.ant.amazon.com (10.252.51.92) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20; Tue, 21 Oct 2025
 07:25:40 +0000
To: Greg KH <gregkh@linuxfoundation.org>
In-Reply-To: <2025102128-agent-handheld-30a6@gregkh> (Greg KH's message of
 "Tue, 21 Oct 2025 09:16:18 +0200")
References: <20251021070353.96705-2-mngyadam@amazon.de>
 <2025102128-agent-handheld-30a6@gregkh>
Date: Tue, 21 Oct 2025 09:25:37 +0200
Message-ID: <lrkyqms5klnri.fsf@dev-dsk-mngyadam-1c-cb3f7548.eu-west-1.amazon.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Originating-IP: [10.253.107.175]
X-ClientProxiedBy: EX19D042UWA004.ant.amazon.com (10.13.139.16) To
 EX19D013EUB004.ant.amazon.com (10.252.51.92)
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Greg KH <gregkh@linuxfoundation.org> writes: > > > On Tue,
 Oct 21, 2025 at 09:03:35AM +0200, Mahmoud Adam wrote: >> This series aims
 to fix the CVE-2025-38073 for 6.1 LTS. > > That's not going to work until
 there is a fix in the 6.6.y tree first [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vB70R-0008Qe-F4
Subject: Re: [f2fs-dev] [PATCH 6.1 0/8] Backporting CVE-2025-38073 fix patch
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
From: Mahmoud Nagy Adam via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Mahmoud Nagy Adam <mngyadam@amazon.de>
Cc: "Darrick J. Wong" <djwong@kernel.org>, nagy@khwaternagy.com,
 linux-mm@kvack.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 linux-nilfs@vger.kernel.org, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Christoph Hellwig <hch@infradead.org>, Ilya Dryomov <idryomov@gmail.com>,
 linux-ext4@vger.kernel.org, linux-block@vger.kernel.org,
 Damien Le Moal <dlemoal@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>, Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Jens Axboe <axboe@kernel.dk>, linux-nfs@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>, Anna
 Schumaker <anna@kernel.org>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Hannes Reinecke <hare@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Greg KH <gregkh@linuxfoundation.org> writes:

>
>
> On Tue, Oct 21, 2025 at 09:03:35AM +0200, Mahmoud Adam wrote:
>> This series aims to fix the CVE-2025-38073 for 6.1 LTS.
>
> That's not going to work until there is a fix in the 6.6.y tree first.
> You all know this quite well :(
>
> Please work on that tree first, and then move to older ones.
>

Yup, I've already sent a series for 6.6 yesterday:
https://lore.kernel.org/stable/20251020122541.7227-1-mngyadam@amazon.de/

- MNAdam



Amazon Web Services Development Center Germany GmbH
Tamara-Danz-Str. 13
10243 Berlin
Geschaeftsfuehrung: Christian Schlaeger
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
