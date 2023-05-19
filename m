Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A72D709958
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 May 2023 16:17:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q00vB-0008Rz-NY;
	Fri, 19 May 2023 14:17:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hare@suse.de>) id 1q00v8-0008Rt-J6
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 May 2023 14:17:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0+VZ1HyTsuRdYwi+hWd9cIzn7uyvdspX3l+sCDgOvwM=; b=k2TfilmNTCMPg9N7Im1Uy5WRmw
 tSOUZbH20Z1PbqXTkvN5JXFRlP/xV1563qS6vAPW1lLraIsvyWmt3ialazZEtz8MejjJFF+rC0HUv
 MN2GVtRF3dub0h++zKr233RbXp16m/E2VUVOpjKtu6UDMWLsIO6UNwei+sSBP3YBHblw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0+VZ1HyTsuRdYwi+hWd9cIzn7uyvdspX3l+sCDgOvwM=; b=hu97TP59pU4trscFyQlCeC7TnO
 hE/T7MVyQW0ntSg9dExhclEceKXA35oR6GYaZhxdWqF1EnDWVt/WHs6BcPgPGd8HYGRhdVhcFRMBD
 RzQFll26wzZt4JtesBUv3C2k59Ag/7Do3/87K7/g1pdxutdo82YrqZei0MJRbmlj9uQo=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q00v5-0000ge-J5 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 May 2023 14:17:26 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 48C7922179;
 Fri, 19 May 2023 14:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1684505837; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0+VZ1HyTsuRdYwi+hWd9cIzn7uyvdspX3l+sCDgOvwM=;
 b=lUR/RERVITvOIkTMYj6gZ+8JeXHqan3Bnna1FOBmjp847w9ZHf0T6hzhM7Eq/A1T0L/dJx
 4wI5ealbv3H9+kP1cNsE/jTxKje5DwlQj8mmbM95l7QnmE1+pQihUz/KdlG3xypRVqbmYZ
 7C0GNrUdzrqlPr3V5FwR/UHrQKpeLp8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1684505837;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0+VZ1HyTsuRdYwi+hWd9cIzn7uyvdspX3l+sCDgOvwM=;
 b=0H/DQLixAzELypiG8mcDJ4c7dKWgixPm6jvK/14EDBieNR/7dM/kD/ybovU/M5icvpLBTz
 2GDt3VvKWgu74TCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D7D5313A12;
 Fri, 19 May 2023 14:17:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cB26M+yEZ2ThHQAAMHmgww
 (envelope-from <hare@suse.de>); Fri, 19 May 2023 14:17:16 +0000
Message-ID: <adb6e8d5-9bc5-e988-f21a-1c3e5191e66b@suse.de>
Date: Fri, 19 May 2023 16:17:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20230424054926.26927-1-hch@lst.de>
 <20230424054926.26927-2-hch@lst.de>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20230424054926.26927-2-hch@lst.de>
X-Spam-Score: -4.5 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/24/23 07:49,
 Christoph Hellwig wrote: > buffer_check_dirty_writeback
 is only used by the block device aops, > remove the export. > > Signed-off-by:
 Christoph Hellwig <hch@lst.de> > --- > fs/buffe [...] 
 Content analysis details:   (-4.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1q00v5-0000ge-J5
Subject: Re: [f2fs-dev] [PATCH 01/17] fs: unexport
 buffer_check_dirty_writeback
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
Cc: linux-block@vger.kernel.org, linux-nfs@vger.kernel.org,
 cluster-devel@redhat.com, linux-xfs@vger.kernel.org,
 Miklos Szeredi <miklos@szeredi.hu>, "Darrick J. Wong" <djwong@kernel.org>,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 ceph-devel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 4/24/23 07:49, Christoph Hellwig wrote:
> buffer_check_dirty_writeback is only used by the block device aops,
> remove the export.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   fs/buffer.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/fs/buffer.c b/fs/buffer.c
> index 9e1e2add541e07..eb14fbaa7d35f7 100644
> --- a/fs/buffer.c
> +++ b/fs/buffer.c
> @@ -111,7 +111,6 @@ void buffer_check_dirty_writeback(struct folio *folio,
>   		bh = bh->b_this_page;
>   	} while (bh != head);
>   }
> -EXPORT_SYMBOL(buffer_check_dirty_writeback);
>   
>   /*
>    * Block until a buffer comes unlocked.  This doesn't stop it

Reviewed-by: Hannes Reinecke <hare@suse.de>

Cheers,

Hannes


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
