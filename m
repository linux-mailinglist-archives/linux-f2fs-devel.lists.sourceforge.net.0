Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (unknown [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9C06C5E9A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Mar 2023 06:17:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pfDJv-0003HJ-Vd;
	Thu, 23 Mar 2023 05:17:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ming.lei@redhat.com>) id 1pfDJt-0003HC-TF
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Mar 2023 05:17:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HoUzTMO8R5MhPq7S8OoMssryl9/6eR6zluDti49MEro=; b=ksJwEn04P0AFim9batU1ReBLtB
 +Edt7LuLU1GHjbc4k4aXBE3vKCGtDkMJi/Y8IXBOWpZqHYJFOEiPkI6jLs9sD2lpwmcmaNVPHu6pn
 mz9mtF+TTEK/oUfkMLZoZPB7QjeRi9yq3MWM1xkwJboPLW9fdkfkq9aKU32GwtAKPCKs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HoUzTMO8R5MhPq7S8OoMssryl9/6eR6zluDti49MEro=; b=UEj9/Iz4oslweW9JWLntHLh5y0
 6JbG6KpoMyRf+8JynJx83cDDTsjTvuzeB11y+jtMjbDBC7/xJc6rycA872b+jHK62yNKGF1aGOh7j
 yIofsoR6lWSv5gAyTHzHjSLDHzb4+ZUFI/mhKCGK+oCSqOvVBy8kIUNBe+/UXS2RzeMw=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pfDJn-00HJV8-VR for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Mar 2023 05:17:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679548609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HoUzTMO8R5MhPq7S8OoMssryl9/6eR6zluDti49MEro=;
 b=C96ibbiIuzN3zlyh6zyQ8Fswhj48p5IeO4UJvpUfhLHTHmPNbleUia9lT07XxvEa/+V+ul
 QR/9MGJy2B5pbNLGBdLVZfxlyWj528TB+X8tjDaHPxybajNXKBd5TFMLn176WfPkydQZK4
 /v71z2/MFv13R9PdHMp7qvSOAmEpfCg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-KY9zo7YzPqyCZhglvOgcqw-1; Thu, 23 Mar 2023 01:16:43 -0400
X-MC-Unique: KY9zo7YzPqyCZhglvOgcqw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 362258828C2;
 Thu, 23 Mar 2023 05:16:41 +0000 (UTC)
Received: from ovpn-8-16.pek2.redhat.com (ovpn-8-16.pek2.redhat.com
 [10.72.8.16])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D3854021B1;
 Thu, 23 Mar 2023 05:16:24 +0000 (UTC)
Date: Thu, 23 Mar 2023 13:16:20 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <ZBvgpBzEuFuyOD/c@ovpn-8-16.pek2.redhat.com>
References: <20230322165830.55071-1-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230322165830.55071-1-frank.li@vivo.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Mar 23, 2023 at 12:58:30AM +0800, Yangtao Li wrote:
 > There are plenty of using kobject_del() and kobject_put() together > in
 the kernel tree. This patch wraps these two calls in a single help [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.129.124 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pfDJn-00HJV8-VR
Subject: Re: [f2fs-dev] [PATCH v3 01/10] kobject: introduce
 kobject_del_and_put()
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
Cc: rafael@kernel.org, djwong@kernel.org, joseph.qi@linux.alibaba.com,
 linux-mtd@lists.infradead.org, naohiro.aota@wdc.com,
 linux-nilfs@vger.kernel.org, richard@nod.at, mark@fasheh.com,
 trond.myklebust@hammerspace.com, xiang@kernel.org, josef@toxicpanda.com,
 ming.lei@redhat.com, huyue2@coolpad.com, dsterba@suse.com, jlbec@evilplan.org,
 jefflexu@linux.alibaba.com, jaegeuk@kernel.org, konishi.ryusuke@gmail.com,
 linux-nfs@vger.kernel.org, clm@fb.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, ocfs2-devel@oss.oracle.com, anna@kernel.org,
 linux-fsdevel@vger.kernel.org, jth@kernel.org, linux-erofs@lists.ozlabs.org,
 damien.lemoal@opensource.wdc.com, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Mar 23, 2023 at 12:58:30AM +0800, Yangtao Li wrote:
> There are plenty of using kobject_del() and kobject_put() together
> in the kernel tree. This patch wraps these two calls in a single helper.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
> v3:
> -convert to inline helper
> v2:
> -add kobject_del_and_put() users
>  include/linux/kobject.h | 13 +++++++++++++
>  lib/kobject.c           |  3 +--
>  2 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/kobject.h b/include/linux/kobject.h
> index bdab370a24f4..e21b7c22e355 100644
> --- a/include/linux/kobject.h
> +++ b/include/linux/kobject.h
> @@ -112,6 +112,19 @@ extern struct kobject * __must_check kobject_get_unless_zero(
>  						struct kobject *kobj);
>  extern void kobject_put(struct kobject *kobj);
>  
> +/**
> + * kobject_del_and_put() - Delete kobject.
> + * @kobj: object.
> + *
> + * Unlink kobject from hierarchy and decrement the refcount.
> + * If refcount is 0, call kobject_cleanup().
> + */
> +static inline void kobject_del_and_put(struct kobject *kobj)
> +{
> +	kobject_del(kobj);
> +	kobject_put(kobj);
> +}

kobject_put() actually covers kobject removal automatically, which is
single stage removal. So if you see the two called together, it is
safe to kill kobject_del() directly.


thanks,
Ming



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
