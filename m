Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B5C535C3A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 May 2022 11:03:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nuVsB-0000Cz-SM; Fri, 27 May 2022 09:03:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <fweimer@redhat.com>) id 1nuVsA-0000Cs-KW
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 27 May 2022 09:03:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:In-Reply-To:
 Date:References:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VxSx5WHE/is7ha0Qn9ZHkh6x3/barWbE89a+k35Foho=; b=CfUyb06hDLnkDFaBgHoCW/j11b
 4FTbG44wuVUxRvf2MUaRIf8BBNXBzmwxOw7pVMKAdMSAmrvoeBEi9L1Ad5nU5d1vvwgaI5/sHwVpj
 jlW/sD8CpHSbjOlJ1dIxu2fYoKLbfN9IX4DUdQ/D9WL1BEb+EP1QUNZi+ryv/dBV2jTI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VxSx5WHE/is7ha0Qn9ZHkh6x3/barWbE89a+k35Foho=; b=NjlXTmG1jnkqvV0iZdv1KpCdq5
 qW0zcMlbt15RsKktLJb2ivBDAQBBoUPXk8TpN4c4Ghysgv3IMWcyxcnOtDS76arq3CApwXjIr321O
 Q2EmmT6J8G5YF0Nu3owIxW4y5o+OdndvXeSowOLQn5J+fC0uVS3TYFjO6D5gg6HWarQM=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nuVs6-0044XY-5c
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 27 May 2022 09:03:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653642175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VxSx5WHE/is7ha0Qn9ZHkh6x3/barWbE89a+k35Foho=;
 b=U1i/CMce/71+Vm99Gn0MUAGioyubgfWkRunDL45mcwWCas/s0RMv9EemQ/PPjNjZHBQN7a
 TG4ms7S8yfCPS9LP1KHsFT1A4QX324jqJj9UoyA/Yzv/sm/H7FCpZNLFduehWfy7b6PG2n
 hrwoLGYxr9xbEh2SwzGvsAIzRj+sh88=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-391-NTi_t_sZMdal6y7vIU_a0A-1; Fri, 27 May 2022 05:02:51 -0400
X-MC-Unique: NTi_t_sZMdal6y7vIU_a0A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF12E858EEE;
 Fri, 27 May 2022 09:02:50 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.39.192.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 64FE7492C3B;
 Fri, 27 May 2022 09:02:48 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
References: <20220518235011.153058-1-ebiggers@kernel.org>
 <20220518235011.153058-2-ebiggers@kernel.org>
Date: Fri, 27 May 2022 11:02:46 +0200
In-Reply-To: <20220518235011.153058-2-ebiggers@kernel.org> (Eric Biggers's
 message of "Wed, 18 May 2022 16:50:05 -0700")
Message-ID: <87r14ffivd.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: * Eric Biggers: > diff --git a/include/uapi/linux/stat.h
 b/include/uapi/linux/stat.h
 > index 1500a0f58041a..f822b23e81091 100644 > --- a/include/uapi/linux/stat.h
 > +++ b/include/uapi/linux/stat.h > @@ -124,9 +124,13 [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nuVs6-0044XY-5c
Subject: Re: [f2fs-dev] [RFC PATCH v2 1/7] statx: add I/O alignment
 information
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
Cc: linux-block@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Keith Busch <kbusch@kernel.org>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

* Eric Biggers:

> diff --git a/include/uapi/linux/stat.h b/include/uapi/linux/stat.h
> index 1500a0f58041a..f822b23e81091 100644
> --- a/include/uapi/linux/stat.h
> +++ b/include/uapi/linux/stat.h
> @@ -124,9 +124,13 @@ struct statx {
>  	__u32	stx_dev_minor;
>  	/* 0x90 */
>  	__u64	stx_mnt_id;
> -	__u64	__spare2;
> +	__u32	stx_mem_align_dio;	/* Memory buffer alignment for direct I/O */
> +	__u32	stx_offset_align_dio;	/* File offset alignment for direct I/O */
>  	/* 0xa0 */
> -	__u64	__spare3[12];	/* Spare space for future expansion */
> +	__u32	stx_offset_align_optimal; /* Optimal file offset alignment for I/O */
> +	__u32	__spare2;
> +	/* 0xa8 */
> +	__u64	__spare3[11];	/* Spare space for future expansion */
>  	/* 0x100 */
>  };

Are 32 bits enough?  Would it make sense to store the base-2 logarithm
instead?

Thanks,
Florian



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
