Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 02234C7F0CA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Nov 2025 07:28:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zc6M5M1GWgdH7XS1y9jLutLqXWDuCchDTR6yrc2AHas=; b=akQF4pXvFPYf4ssQSxICFF54D7
	f4hcYzuU3fWxOOnvaYdOX5vUC4L/0czcHfym81lSWDkcWuFcJEBLqlsPFl6R1SGYwYcFJFQo05b+j
	Acr55Y/27zc14TqdZpCrgEjU4YM22hgwGnNZJ27JkR7K+OezZP6P3YpS7EfDcrBpBj+M=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vNQ3U-0001s3-9B;
	Mon, 24 Nov 2025 06:28:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1vNQ3T-0001rv-Oj
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 06:28:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AbkeFVJ7qDSlV8hqE4hJxAujZBvjESiTLsenNqOfrxc=; b=diya+d53l6kVpbCK3TVe6goulj
 m8DkOjxFXYiKB3gUQfG0gDdT8613HiMm0fcbT0Ily8xVE0dH2zs7i6Wzj/95J9MD3zycwB6WTtzyL
 r9CkxUek6XdtDcT3Ndv7dsmP8GlbkN6Lo8Tei0dcPAmUG3dNP2nw5qiKUXAtcIRekl90=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AbkeFVJ7qDSlV8hqE4hJxAujZBvjESiTLsenNqOfrxc=; b=hYjihhPy6Agz8Uk7qn/pGHWI0e
 og1r/KzbJI67G2YdMcF31B2qQeZU5Tyl3VOJybkaFogACtODX4ZzmBY9c6GQr0gJ2UwPPyUydgKun
 R1d5yZKQ1mnkZrGZbsxOjOAqWqFuX44cvcCi0/nJoeZTMQQFRcDgPZgm904BDnI+ddd4=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vNQ3T-00070w-TM for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 06:28:08 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 7A37968B05; Mon, 24 Nov 2025 07:27:54 +0100 (CET)
Date: Mon, 24 Nov 2025 07:27:54 +0100
From: Christoph Hellwig <hch@lst.de>
To: Yu Kuai <yukuai@fnnas.com>
Message-ID: <20251124062754.GB16702@lst.de>
References: <20251124025737.203571-1-ckulkarnilinux@gmail.com>
 <20251124025737.203571-3-ckulkarnilinux@gmail.com>
 <d86b820a-46c9-43b6-9fe2-dbd991b76520@fnnas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d86b820a-46c9-43b6-9fe2-dbd991b76520@fnnas.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Nov 24, 2025 at 02:24:05PM +0800, Yu Kuai wrote: >
 mdraid and dm are different drivers, please split them. Yes. Both parts looks
 fine to me, though. So: Reviewed-by: Christoph Hellwig <hch@lst.de> 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1vNQ3T-00070w-TM
Subject: Re: [f2fs-dev] [PATCH V2 2/5] dm: ignore discard return value
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
Cc: axboe@kernel.dk, dm-devel@lists.linux.dev, kch@nvidia.com, sagi@grimberg.me,
 linux-xfs@vger.kernel.org, cem@kernel.org, snitzer@kernel.org,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-raid@vger.kernel.org, linux-block@vger.kernel.org, song@kernel.org,
 Chaitanya Kulkarni <ckulkarnilinux@gmail.com>, mpatocka@redhat.com,
 jaegeuk@kernel.org, bpf@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, hch@lst.de, agk@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Nov 24, 2025 at 02:24:05PM +0800, Yu Kuai wrote:
> mdraid and dm are different drivers, please split them.

Yes.  Both parts looks fine to me, though.  So:

Reviewed-by: Christoph Hellwig <hch@lst.de>

for the next round.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
