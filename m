Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E446ACA06
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  6 Mar 2023 18:25:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pZEam-0004Ny-Th;
	Mon, 06 Mar 2023 17:25:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <SRS0=eSXo=66=goodmis.org=rostedt@kernel.org>)
 id 1pZEah-0004Nn-Vf for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Mar 2023 17:25:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gMyuwAgg66NA6uwQcUW2rEIBxs+9p7goscXgv6REDMk=; b=UyKdR41risk09yfLqDb1SLN7p2
 ATXbw2yrymR2oNwuuQjVpxOkTQSCigbvGbaKXVvt/O2tK65B84prXgxbfVTB7e/eVqNyQC3TTC2Wq
 wHx9xlB29dukL4BNOkMNSCRObHj7JaoM/DqcPQWnughUcRvFEabGXpoRuE2X3J6xY1q8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gMyuwAgg66NA6uwQcUW2rEIBxs+9p7goscXgv6REDMk=; b=VHBROPIs55WUZ2ga1nRTCkzzj2
 NVpseAu4+HZeJQjkHUM8Mwmx3f0nB6IAPK4LHorK/lCRTvxwHNYQ4D7ZFSA55IV2yiQcR3IuO4nQq
 SRZglXova3KAWG2zltzzunC6n/Hmnb3uIb2I8sufWCIGhH/tCzqRRs/GgcA6Enk1ABU0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pZEaf-001Ehi-Dr for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Mar 2023 17:25:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 059ED61030;
 Mon,  6 Mar 2023 17:25:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B03D8C433D2;
 Mon,  6 Mar 2023 17:25:30 +0000 (UTC)
Date: Mon, 6 Mar 2023 12:25:29 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Douglas RAILLARD <douglas.raillard@arm.com>
Message-ID: <20230306122529.44e8d566@gandalf.local.home>
In-Reply-To: <20230306111513.2aa49b1a@gandalf.local.home>
References: <20230306122549.236561-1-douglas.raillard@arm.com>
 <20230306111513.2aa49b1a@gandalf.local.home>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Spam-Score: -4.8 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon,
 6 Mar 2023 11:15:13 -0500 Steven Rostedt <rostedt@goodmis.org>
 wrote: > > diff --git a/include/trace/events/f2fs.h
 b/include/trace/events/f2fs.h
 > > index 31d994e6b4ca..8d053838d6cf 100644 > > ---
 a/include/trace/events/f2fs.h
 > > +++ b/include/trace/events/f2fs.h > > @ [...] 
 Content analysis details:   (-4.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1pZEaf-001Ehi-Dr
Subject: Re: [f2fs-dev] [PATCH] f2fs: Fix f2fs_truncate_partial_nodes ftrace
 event
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
Cc: "open list:TRACING" <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Masami Hiramatsu <mhiramat@kernel.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>,
 "open list:TRACING" <linux-trace-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, 6 Mar 2023 11:15:13 -0500
Steven Rostedt <rostedt@goodmis.org> wrote:

> > diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
> > index 31d994e6b4ca..8d053838d6cf 100644
> > --- a/include/trace/events/f2fs.h
> > +++ b/include/trace/events/f2fs.h
> > @@ -512,7 +512,7 @@ TRACE_EVENT(f2fs_truncate_partial_nodes,
> >  	TP_STRUCT__entry(
> >  		__field(dev_t,	dev)
> >  		__field(ino_t,	ino)
> > -		__field(nid_t,	nid[3])  
> 
> That should not have even compiled. I'll see if I can add some tricks to
> make that fail.

And this patch makes that happen!

-- Steve

diff --git a/include/trace/stages/stage5_get_offsets.h b/include/trace/stages/stage5_get_offsets.h
index ac5c24d3beeb..e30a13be46ba 100644
--- a/include/trace/stages/stage5_get_offsets.h
+++ b/include/trace/stages/stage5_get_offsets.h
@@ -9,17 +9,30 @@
 #undef __entry
 #define __entry entry
 
+/*
+ * Fields should never declare an array: i.e. __field(int, arr[5])
+ * If they do, it will cause issues in parsing and possibly corrupt the
+ * events. To prevent that from happening, test the sizeof() a fictitious
+ * type called "struct _test_no_array_##item" which will fail if "item"
+ * contains array elements (like "arr[5]").
+ *
+ * If you hit this, use __array(int, arr, 5) instead.
+ */
 #undef __field
-#define __field(type, item)
+#define __field(type, item)					\
+	{ (void)sizeof(struct _test_no_array_##item *); }
 
 #undef __field_ext
-#define __field_ext(type, item, filter_type)
+#define __field_ext(type, item, filter_type)			\
+	{ (void)sizeof(struct _test_no_array_##item *); }
 
 #undef __field_struct
-#define __field_struct(type, item)
+#define __field_struct(type, item)				\
+	{ (void)sizeof(struct _test_no_array_##item *); }
 
 #undef __field_struct_ext
-#define __field_struct_ext(type, item, filter_type)
+#define __field_struct_ext(type, item, filter_type)		\
+	{ (void)sizeof(struct _test_no_array_##item *); }
 
 #undef __array
 #define __array(type, item, len)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
