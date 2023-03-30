Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F0F6D0ADB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 Mar 2023 18:16:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1phuwb-00088l-2X;
	Thu, 30 Mar 2023 16:16:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1phuwY-00088e-2R
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 Mar 2023 16:16:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AAlJvjYzVaSw46YLu12Stghylz9PDV1pfEvSMqVuWeU=; b=kKIoXlg94+I708wEvx14hGCibn
 /2ertCXQbl2/WRRk2zuCo0iDccfsI/PJSRr7Z4jqjRFCXHknz5wlljCPgnhc6cFdfjovsJEQhdHiW
 CpQxQEUX0tt/dBn0ppYgjYFxgaUej1dgP4PBgOuGqE+zTUJA30Wm8k0GCG6srUqTke3U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AAlJvjYzVaSw46YLu12Stghylz9PDV1pfEvSMqVuWeU=; b=dL518WTraYNJwH+R8I4MjO4swe
 pufqwrpToEMUaA+Fmxv/0xAA4QFiQT1mG8SP2mkpLMbI6Te1hRJQxi/6BVcARXqSHff7qX6OPxYlC
 bTrUZ3RaG1NESjgHoCfr654ao81l8Agt7nyvrxA0rliYdz1UuzXRs034K7Owc7KxQjlo=;
Received: from mail-sgaapc01on2119.outbound.protection.outlook.com
 ([40.107.215.119] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1phuwS-009sBe-Uh for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 Mar 2023 16:16:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J17Mul2/skz4NXg0DHh+r1mKlA/ja9ByiRIBGEgmZ6C2gjf/cOtXjvO2aFTe+QbuTUbPQGUblzV/dkVFkm/t+ZqXeM62bHLOeffUP6nJW4jwEYHo5Bgeirz9A7pJHR1knBR6wAA3l8qqM33WhB9VguTJGQ3ATx0p0+BP9mrjHVGRs5pHyCjzJu3snkdBsNkkCNDM5+U2Td9R2dZeHHgAkfHKxvy1nsTdhe6D1FB5ls5tyaW77YJVbsR+CGlEN/+LLArZpigPkddbMFiMJ8EKVOUfGqhW2u7gzof6wLGqD/KtyZgQZbyBliXQ0CKUy4fV4cCw1I2Tu0YdEZhewjzzRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AAlJvjYzVaSw46YLu12Stghylz9PDV1pfEvSMqVuWeU=;
 b=AfgSouIoMXtlPceVagjOgrRwB1GHpNO/Z8nYPFQFhkgJRAL75TO96lpUgt5o+dAnAgfMWBlYLeGrpk3ThiK1sa1JhekEGHV+ImnHF5W3dFJ9x6gWs5RFtKYqme2xrsXKLDG70emC57uCUpG7zuR6ZHir/fqsIvV9q0qyQID3LeKaJ9SDJ1zgjj3fqFBjUcewxSN9qrZxt0Jp2llbrLUHvkEiphvPNRvMLNqfZxk4Xoj67DxJsCF8Ky5BiWl9c7M4bbVcgH3m0oPV9Kcq+VOxZ2c/hyvbGKO0xCTDLgX6ih67btggZQqMtlt15dpDOBQcg9tF6/YeAxSywi8EeEo28w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AAlJvjYzVaSw46YLu12Stghylz9PDV1pfEvSMqVuWeU=;
 b=AP4M04A6+L91f6TExcBY8+YyIuGnLgI/9qW60zvhkrzefhYz1OnAb19OCdGLA51dD1BIFcvSE/erb3I85k0mItMeEOOOf9XSMNHpQ7RvnrWUaMg6WPoYWyDAuBzvB1FMYEURKpEQzlQ6RQquLuMIs7eRwiqv6ylYiao8D5q+Uu/kUfLwZD/n251iPsFwGv5HjxPmZ5yGS1m3VGOYs3VcvgNUkQlcUcdJcIDddACwns2G0w4B73VyYSG24s4hwK1fq+jCeXpYNvftYbk/ABV1fk9DFtJp2xDL9G4Bi9fU9x7ZwuQzcsumuZnLylURuGSh42lf0fm9o/vU+J9Q9P928Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEZPR06MB5166.apcprd06.prod.outlook.com (2603:1096:101:40::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Thu, 30 Mar
 2023 16:15:48 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c%6]) with mapi id 15.20.6222.033; Thu, 30 Mar 2023
 16:15:48 +0000
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 31 Mar 2023 00:15:38 +0800
Message-Id: <20230330161538.13233-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230330153719.3085164-1-shengyong@oppo.com>
References: <20230330153719.3085164-1-shengyong@oppo.com>
X-ClientProxiedBy: SI2PR01CA0005.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::23) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEZPR06MB5166:EE_
X-MS-Office365-Filtering-Correlation-Id: 52b22f10-9b4a-4c46-fe42-08db313a056e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FbwGwwZL4aKGCbAhtNHi3kfdlQl8k3zudfAjuS6LtG/5VObNlNnjgtsm3rQjtjwm3j8I9QW2KkA7FO6ySxoOU+VK/kXyBYo6N/IQzmDMZeQA9tglSR+fUnH+EJRSsw7OE6lUAetpMwy4BPslN+tSOqGxxJDU7giBdgtcanMvbh1TYhVQoSP2vwVSYiceh2Q5DI9zd0SqNNvfXOBPRC+Z2yUY/YEUm31ahfigxFzXA1J9m+OhYSCnyrIBAMp1h7CbR4lwVwb/1Ck24BfaMErz592/DU+4p9Ti7Nto4fcUAKEYEpBk6fdscTqn30dtxy/JsUXjLeoNY/z70TYuzaQWo+owD1fKswXzB8Srpg0tbTFccnMgTb60X+P16pYNOY/uzIfMznlRuCu0Jg7SUITdCL7TFYH947JBiHpx4SFv6yabXB7nOSoKOx3PJ01WHE0SEia/Qt22iYSEwxlZJQ+YKig5LgO4JYik6vURuSgSPg35nB8mEbMsZV2VgndfT343HAvO9arO0PuBqmP4RwONsGnL1vw5KiXIaNUr/DEFvL22h0ua/LYsLiSNDLzGbvjo7iJ1yJeLKBmL1flLBytEx7JpOYnHjwtL82xiAhwTsoc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(451199021)(52116002)(6916009)(4326008)(41300700001)(316002)(8676002)(66556008)(66476007)(478600001)(66946007)(38100700002)(38350700002)(83380400001)(186003)(5660300002)(2616005)(558084003)(86362001)(36756003)(966005)(6486002)(6666004)(6506007)(2906002)(6512007)(26005)(1076003)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HglN92VqOil7l+4c4Leaq51dvNFvf4ZKzURZTWMdSosV8LAPw1KPs+tKkJm0?=
 =?us-ascii?Q?hj1Mx4J7a+IN8OYfVKnLY1c8byzr17WMJWi/2BiUQ9v4AX7nUTju2eH0qKHC?=
 =?us-ascii?Q?sMBg9pZlgXfU55bAoj7KPmC2PNKFpqrFhKMP6mjxdk7ldjMPoM+TI8+HFCIs?=
 =?us-ascii?Q?1LJCKKsK9zxh6KxmIL0X3/iVNPoP4GMQSkCLWpR4ERnUGyjG8Qb13rGLafc5?=
 =?us-ascii?Q?aB8ipSNzHMo3xZS4EW4ucZo03HFymIOO7RgEXYiYc0yzH5tRC/BwvNYNsjEF?=
 =?us-ascii?Q?RGt8JL4+nWPHFq1WW9AqnIsK66uvqU0xi9TjQwWfMFAcTiFRn0a/fDq2usk1?=
 =?us-ascii?Q?699HeymQAgP9iuugzvY8YL2NozAEJPy8K6fEyxlVS7YxP7gzFBaopGLYENnv?=
 =?us-ascii?Q?Fj1Ocu5kTZ41wcJ7GBomqE+pDBoTRSmUVK37axkVME7+PDNh6O55lAjlvu5s?=
 =?us-ascii?Q?0uaX4YSo+nMS20v2bWz5ZKyxUhrEgBRgc6ObG8pYqe4tNUZoDs7tTfFUXobg?=
 =?us-ascii?Q?cwPFnhoVSQPG/wShdPKH0yeiF1UES3qgEjx0eauAyQSpTOvNfwVfrS95tL+/?=
 =?us-ascii?Q?FzUMWO+av/1ggOioa+VDlzH4LL8/BbVjoVAAQaouDuLBGGqxy1ZlLjgS7gvj?=
 =?us-ascii?Q?f4Nzzj28G2KxqTbr1UvGH8W6EPbwLuv276N+WGRa9eQx3vbtS19ufguZ+KZT?=
 =?us-ascii?Q?YTA661HaMRFcTx/6EuENCmPWaOV74UCkNuTfI40eCigsXpQo0mfoXczomBAN?=
 =?us-ascii?Q?5/GcYnuwJKFmJmxUVxqk+14APJyL/WFl3ziiAXQDfpT6LZdmqNVnIh20OfNi?=
 =?us-ascii?Q?4zrfCa0JJ/a+Szoif6lFZLRB5iYQMuoH8tEfrzGUj0vQ0QB1IEWQ6mOcrT6/?=
 =?us-ascii?Q?+LiO1V3my1vx0BtQfHl6yngbpo+JLEOOyOgQ3TQ/mJbVxBSd47cfY/HWgoF7?=
 =?us-ascii?Q?Bazqago5422hIoIB7eHdgiFOCxbSYWu6oL6i1aKq1iRkRAKHrqiX7uHwsuaJ?=
 =?us-ascii?Q?MbMpmnHKDWTogh/r7Wv7J++IDHDBYH8Slh7kZThqu8auwe3avNup5k1ZNuI7?=
 =?us-ascii?Q?Sf3lz5e67/P2LKPCP20QHLgMDrAvxDGMY8flua6iQlwlcSlZm+hINhgdz6yC?=
 =?us-ascii?Q?SAj/bX365PDuKSUOV3lysol6NAz6mZ531tJLOZM60x5qfychYklp8FbxmnK+?=
 =?us-ascii?Q?5YmwDfxIHWzMGgDl+wTCidK4sVK4pKMAp7CFiGhXoSl19tuWMJY592njyTWq?=
 =?us-ascii?Q?OD9TlpwkIEXvDhKO/L+tbK2rZy7LhiKtoha/d8V1nYAcYfJxsKFCh1fVdHmI?=
 =?us-ascii?Q?daiIyWt/wUnsdgNU+XwSq4OpxRtEIob14A4PR5UFrTkzmtex7XtRM5fUSfmR?=
 =?us-ascii?Q?rNRcW+J9yAfuFkINBVRUutSwVZnf6ozlg/onLXmbKBT2zlKZ8PB+4YmjakhJ?=
 =?us-ascii?Q?Ej3RfYJ15+u85dyK+QcMh/ekYegjSBYNE4w99YFk8MK8Ne3lkJIko4Sdv2zs?=
 =?us-ascii?Q?DzlMRic/+fM4r+BhjVc2zblmSVOj5OePCGOQ/0H+N6J/lnD2EAI4PSenEI9f?=
 =?us-ascii?Q?SqLj4G4NRiXpRXJ9TjVxHQfLM5YdiV1WbFv1LRCt?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52b22f10-9b4a-4c46-fe42-08db313a056e
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 16:15:47.5346 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rd1op4iPJO13QrPkY8IbInIy06qlFJyplWrsTi2WXQAiiN+/SwFBQMxBciP9J5zSHT987l3yqJb4klxo1sOKUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5166
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Sheng Yong, Your idea, I also put forward before. And has
 been sent to version 2, but Chao and Jaegeuk have no comments yet. Time to
 talk about the series? 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.119 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.119 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1phuwS-009sBe-Uh
Subject: Re: [f2fs-dev] [RFC PATCH] f2fs: expand f2fs_compr_option to allow
 ioctl setting compression level
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
From: Yangtao Li via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yangtao Li <frank.li@vivo.com>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Sheng Yong,

Your idea, I also put forward before.

And has been sent to version 2, but Chao and Jaegeuk have no comments yet.
Time to talk about the series?

https://lore.kernel.org/linux-f2fs-devel/20230112133503.16802-1-frank.li@vivo.com/

Thx,
Yangtao


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
