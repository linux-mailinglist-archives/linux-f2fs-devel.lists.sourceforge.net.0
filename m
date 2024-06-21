Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E9F912793
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Jun 2024 16:23:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sKfB8-0007Rc-V8;
	Fri, 21 Jun 2024 14:23:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kent.overstreet@linux.dev>) id 1sKfB7-0007RW-1h
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Jun 2024 14:23:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7s3nraX3meU88oDt2QxTb0nIt092nRV6YyzqRLfGesw=; b=jX+FBX7z7JBuCct8hO77ySA01v
 85ueAY4hZycqGUchpgQy5gewPGL/LhUBEHp5ES5FBszWAji2tx6EsOvLp8Hlp+Y1dl7we4TSknpry
 exxgqwPzdu+YE93B+rDsCX56TWA1GmGpvlDk+PAEyUUGS/JsO2qomcUh5iQWNwLLsyWc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7s3nraX3meU88oDt2QxTb0nIt092nRV6YyzqRLfGesw=; b=IrVJd63jliS/D+P6BscsLHjG0p
 qAweu1DyNLv+tYFWrZXBGYUILXNpIMDwKM7ivgUWpnxdEDQqf+BHogtZhGQ2b1B9KHgJVPV40l65O
 FKfd8SgA13lvl+0RR2d+b+IodUf++9eDBcIt0sivzMjPOBxhFhXRocch8SOLYBXV6Jy4=;
Received: from out-174.mta0.migadu.com ([91.218.175.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sKfB5-00084t-M8 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Jun 2024 14:23:48 +0000
X-Envelope-To: yi.sun@unisoc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1718979815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7s3nraX3meU88oDt2QxTb0nIt092nRV6YyzqRLfGesw=;
 b=xAjRQ0qfong4mJ7qrVMt9jyf6XGP4CctOHJ/+3A+ta9Fl5fSiVki1lM8bhcMoJKOXf60WO
 90doMTyqBOujiLFcyxoeTk58oHuxEFgejEGsY8QsLTdiTo4fJpPFFRQVnNQgo1JJsT9qkg
 FhfEXj0FMq6xNOQHDsCZJB+uHwjLWw4=
X-Envelope-To: sunyibuaa@gmail.com
X-Envelope-To: tj@kernel.org
X-Envelope-To: jaegeuk@kernel.org
X-Envelope-To: chao@kernel.org
X-Envelope-To: ebiggers@google.com
X-Envelope-To: jiangshanlai@gmail.com
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-f2fs-devel@lists.sourceforge.net
X-Envelope-To: niuzhiguo84@gmail.com
X-Envelope-To: hao_hao.wang@unisoc.com
X-Envelope-To: yunlongxing23@gmail.com
Date: Fri, 21 Jun 2024 10:23:31 -0400
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Yi Sun <yi.sun@unisoc.com>
Message-ID: <dst4qsqyrj4mvnpgrgaaqdzazn27xghjaudzdmpdwyb2guklag@ggrdrcpjclhb>
References: <20240621062617.595007-1-yi.sun@unisoc.com>
 <20240621062617.595007-2-yi.sun@unisoc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240621062617.595007-2-yi.sun@unisoc.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jun 21, 2024 at 02:26:16PM +0800, Yi Sun wrote: >
 Many works will go to submit_bio(), and in many cases the io priority of >
 kworker cannot meet the real-time requirements of this work. > > So [...]
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linux.dev]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [91.218.175.174 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [91.218.175.174 listed in sa-accredit.habeas.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [91.218.175.174 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1sKfB5-00084t-M8
Subject: Re: [f2fs-dev] [PATCH 1/2] workqueue: add io priority to work_struct
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
Cc: yunlongxing23@gmail.com, ebiggers@google.com, jiangshanlai@gmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 sunyibuaa@gmail.com, tj@kernel.org, jaegeuk@kernel.org,
 Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jun 21, 2024 at 02:26:16PM +0800, Yi Sun wrote:
> Many works will go to submit_bio(), and in many cases the io priority of
> kworker cannot meet the real-time requirements of this work.
> 
> So add the basic attribute ioprio to work_struct, and kworker can adjust
> its io priority according to this attribute.
> 
> Add function set_work_ioprio() to set the io priority of this work.
> Add function may_adjust_work_task_ioprio() to adjust kworker's io priority.
> Add function restore_work_task_ioprio() to restore kworker's io priority.

work_struct!?

there's a lot of task_struct properties we would want work_struct to
inherit if we went this route, but it's just not feasible, work_struct
should be small and thin.

You're always embedding work_struct into your own struct, I would
suggest tracking this yourself - or coming up with a new heavier
standard struct that embeds a work_struct and has io path options,
there's more than just priority.

> 
> Signed-off-by: Yi Sun <yi.sun@unisoc.com>
> ---
>  include/linux/workqueue.h       |  9 ++++++
>  include/linux/workqueue_types.h |  6 ++++
>  kernel/workqueue.c              | 51 +++++++++++++++++++++++++++++++++
>  3 files changed, 66 insertions(+)
> 
> diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
> index fb3993894536..f6191774b730 100644
> --- a/include/linux/workqueue.h
> +++ b/include/linux/workqueue.h
> @@ -286,6 +286,9 @@ static inline unsigned int work_static(struct work_struct *work) { return 0; }
>  		lockdep_init_map(&(_work)->lockdep_map, "(work_completion)"#_work, (_key), 0); \
>  		INIT_LIST_HEAD(&(_work)->entry);			\
>  		(_work)->func = (_func);				\
> +		(_work)->ioprio = 0;					\
> +		(_work)->ori_ioprio = 0;				\
> +		(_work)->ioprio_flag = 0;				\
>  	} while (0)
>  #else
>  #define __INIT_WORK_KEY(_work, _func, _onstack, _key)			\
> @@ -294,6 +297,9 @@ static inline unsigned int work_static(struct work_struct *work) { return 0; }
>  		(_work)->data = (atomic_long_t) WORK_DATA_INIT();	\
>  		INIT_LIST_HEAD(&(_work)->entry);			\
>  		(_work)->func = (_func);				\
> +		(_work)->ioprio = 0;					\
> +		(_work)->ori_ioprio = 0;				\
> +		(_work)->ioprio_flag = 0;				\
>  	} while (0)
>  #endif
>  
> @@ -585,6 +591,9 @@ extern struct work_struct *current_work(void);
>  extern bool current_is_workqueue_rescuer(void);
>  extern bool workqueue_congested(int cpu, struct workqueue_struct *wq);
>  extern unsigned int work_busy(struct work_struct *work);
> +extern void set_work_ioprio(struct work_struct *work, unsigned short ioprio);
> +extern void may_adjust_work_task_ioprio(struct work_struct *work);
> +extern void restore_work_task_ioprio(struct work_struct *work);
>  extern __printf(1, 2) void set_worker_desc(const char *fmt, ...);
>  extern void print_worker_info(const char *log_lvl, struct task_struct *task);
>  extern void show_all_workqueues(void);
> diff --git a/include/linux/workqueue_types.h b/include/linux/workqueue_types.h
> index 4c38824f3ab4..d9969596bbc3 100644
> --- a/include/linux/workqueue_types.h
> +++ b/include/linux/workqueue_types.h
> @@ -17,6 +17,12 @@ struct work_struct {
>  	atomic_long_t data;
>  	struct list_head entry;
>  	work_func_t func;
> +	/* If the work does submit_bio, io priority may be needed. */
> +	unsigned short ioprio;
> +	/* Record kworker's original io priority. */
> +	unsigned short ori_ioprio;
> +	/* Whether the work has set io priority? */
> +	long ioprio_flag;
>  #ifdef CONFIG_LOCKDEP
>  	struct lockdep_map lockdep_map;
>  #endif
> diff --git a/kernel/workqueue.c b/kernel/workqueue.c
> index 003474c9a77d..a44a8f92eec2 100644
> --- a/kernel/workqueue.c
> +++ b/kernel/workqueue.c
> @@ -55,6 +55,7 @@
>  #include <linux/kvm_para.h>
>  #include <linux/delay.h>
>  #include <linux/irq_work.h>
> +#include <linux/ioprio.h>
>  
>  #include "workqueue_internal.h"
>  
> @@ -6025,6 +6026,56 @@ unsigned int work_busy(struct work_struct *work)
>  }
>  EXPORT_SYMBOL_GPL(work_busy);
>  
> +/**
> + * set_work_ioprio - set io priority for the current work
> + * @work: the work to be set
> + * @ioprio: desired io priority
> + *
> + * This function can be called after INIT_WORK if the io priority
> + * of the work needs to adjust. And it is recommended to use this
> + * function together with may_adjust_work_task_ioprio() and
> + * restore_work_task_ioprio().
> + */
> +void set_work_ioprio(struct work_struct *work, unsigned short ioprio)
> +{
> +	work->ioprio = ioprio;
> +	work->ioprio_flag = 1;
> +}
> +EXPORT_SYMBOL_GPL(set_work_ioprio);
> +
> +/**
> + * may_adjust_work_task_ioprio - adjust the io priority of kworker
> + * @work: the work that kworker will do
> + *
> + * It is recommended to use this function together with set_work_ioprio()
> + * and restore_work_task_ioprio().
> + */
> +void may_adjust_work_task_ioprio(struct work_struct *work)
> +{
> +	if (work->ioprio_flag) {
> +		work->ori_ioprio = get_current_ioprio();
> +		set_task_ioprio(current, work->ioprio);
> +	}
> +}
> +EXPORT_SYMBOL_GPL(may_adjust_work_task_ioprio);
> +
> +/**
> + * restore_work_task_ioprio - restore the io priority of kworker
> + * @work: the work that kworker just did
> + *
> + * When kworker finishes the work, the original io priority of
> + * kworker should be restored. It is recommended to use this function
> + * together with set_work_ioprio() and may_adjust_work_task_ioprio().
> + */
> +void restore_work_task_ioprio(struct work_struct *work)
> +{
> +	if (work->ioprio_flag) {
> +		set_task_ioprio(current, work->ori_ioprio);
> +		work->ioprio_flag = 0;
> +	}
> +}
> +EXPORT_SYMBOL_GPL(restore_work_task_ioprio);
> +
>  /**
>   * set_worker_desc - set description for the current work item
>   * @fmt: printf-style format string
> -- 
> 2.25.1
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
