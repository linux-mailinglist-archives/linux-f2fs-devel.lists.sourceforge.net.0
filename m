Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B04EF4F21
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Nov 2019 16:16:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iT604-0007uG-V2; Fri, 08 Nov 2019 15:16:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <msnitzer@redhat.com>) id 1iT603-0007u5-SK
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Nov 2019 15:16:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sdJq9GCWEigvvKAEhdiMe0zWBDjEkdIA0zDjk+u6lhw=; b=PE9TQSy1dbLyUMhQwHl/oKgDzN
 UkQxQyJrJtounZqvv5jiEPegtWhkGeMGMzXazGKYFIUP5HQEO+gAHkUDG+CKKqKetKj8TUnAPcbyY
 WfOJQQcQkUtoMJeXteWYLt+ymDaxrpsVbd927AxJ0ZZ+XAjoKP3FowL8KadUh/pJrK4Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sdJq9GCWEigvvKAEhdiMe0zWBDjEkdIA0zDjk+u6lhw=; b=b+2AwuSEXyGfl/1+Az5saXWwIf
 KktBL7vKNb3+FMiKn0ZmLy9nJHXStHHnNcjwJ5OIFyMaG/ehILsGZZusbf5Ns/m5SW0jw0b1q/n5h
 zzqm89s2QVYEgERTlcizQJKUeem/01It81kiYeSx6X86t6EHU1ze4kLUxSHmxrR0DSBI=;
Received: from us-smtp-1.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-SHA384:256) (Exim 4.92.2)
 id 1iT600-005Bn8-6E
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Nov 2019 15:16:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573226186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sdJq9GCWEigvvKAEhdiMe0zWBDjEkdIA0zDjk+u6lhw=;
 b=i8KTcFR1U6B7JhBLjIYtnJvTPNYq0v/0xfnE60lRkorIsC37YD0yjhIso43iWLV32ypJ4p
 pHKL7YyF0fir7kIr8hIx/uR2xO0s+9DjIHDJCGH9DBQGyOVcEm7cD/vQi9fBzwmr9T07UD
 miyPvrjMbPeMJvWD6vTlcSHjRnthzCY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-fhtsWwYyNlO4PtBrYovQIw-1; Fri, 08 Nov 2019 10:16:22 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC70B180496F;
 Fri,  8 Nov 2019 15:16:20 +0000 (UTC)
Received: from localhost (unknown [10.18.25.174])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B27485DA7F;
 Fri,  8 Nov 2019 15:16:17 +0000 (UTC)
Date: Fri, 8 Nov 2019 10:16:16 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Damien Le Moal <damien.lemoal@wdc.com>
Message-ID: <20191108151616.GA8047@redhat.com>
References: <20191108015702.233102-1-damien.lemoal@wdc.com>
 <20191108015702.233102-10-damien.lemoal@wdc.com>
MIME-Version: 1.0
In-Reply-To: <20191108015702.233102-10-damien.lemoal@wdc.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: fhtsWwYyNlO4PtBrYovQIw-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lst.de]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iT600-005Bn8-6E
Subject: Re: [f2fs-dev] [PATCH 9/9] block: rework zone reporting
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-scsi@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 dm-devel@redhat.com, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Nov 07 2019 at  8:57pm -0500,
Damien Le Moal <damien.lemoal@wdc.com> wrote:

> From: Christoph Hellwig <hch@lst.de>
> 
> Avoid the need to allocate a potentially large array of struct blk_zone
> in the block layer by switching the ->report_zones method interface to
> a callback model. Now the caller simply supplies a callback that is
> executed on each reported zone, and private data for it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>

Reviewed-by: Mike Snitzer <snitzer@redhat.com>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
